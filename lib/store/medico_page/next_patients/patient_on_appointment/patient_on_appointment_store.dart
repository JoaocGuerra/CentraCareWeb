import 'package:centralcareweb/store/auth/auth_store.dart';
import 'package:centralcareweb/utils/utils_datetime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:mobx/mobx.dart';

import '../../../../model/patient_on_appointment_model.dart';
import '../../../../repository/api/posicao_fila_repository.dart';
import '../next_patients_store.dart';


part 'patient_on_appointment_store.g.dart';

class PatientOnAppointmentStore = _PatientOnAppointmentStore with _$PatientOnAppointmentStore;

abstract class _PatientOnAppointmentStore with Store {

  final _db = FirebaseFirestore.instance;
  final NextPatientsStore nextPatientsStore = GetIt.I<NextPatientsStore>();
  final AuthStore authStore = GetIt.I<AuthStore>();

  @observable
  bool loading = false;

  String diaMesAno = UtilsDateTime.getDatetimeNow();

  @observable
  PatientOnAppointmentModel? patientOnAppointment;

  @observable
  HtmlEditorController htmlEditorController = HtmlEditorController();

  @action
  Future<void> fetchPatientOnAppointment() async {

    String? codigoMedico = authStore.user?.uid;

    _db.collection('fila').doc(codigoMedico!+diaMesAno).snapshots().listen((snapshot) {

      nextPatientsStore.loading = true;

      nextPatientsStore.attendanceFinish = snapshot['concluido'];
      nextPatientsStore.patientPosition = snapshot['paciente'];
      String idPatientCurrent =
      nextPatientsStore.idPatients[
        nextPatientsStore.namePatients[nextPatientsStore.patientPosition-1]
      ]['id'];

      _db.collection('pacientes').doc(idPatientCurrent).get().then((snapshotPatient){

        String fullName = snapshotPatient['nome'] + " " + snapshotPatient['sobrenome'];
        String photo = snapshotPatient['foto'];
        String sex = snapshotPatient['sexo'];
        int idade = UtilsDateTime.calculateAge(snapshotPatient['data_nascimento']);

        patientOnAppointment = PatientOnAppointmentModel(fullName,sex,photo,idade);

      });

      nextPatientsStore.loading = false;

    });

  }
}