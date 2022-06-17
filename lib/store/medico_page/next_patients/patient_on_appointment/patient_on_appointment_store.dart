import 'package:centralcareweb/model/historic_model.dart';
import 'package:centralcareweb/store/auth/auth_store.dart';
import 'package:centralcareweb/utils/utils_datetime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:mobx/mobx.dart';

import '../../../../model/patient_on_appointment_model.dart';
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

  @observable
  List<HistoricModel> listHistoric = [];

  @action
  Future<void> fetchPatientOnAppointment() async {

    String? codigoMedico = authStore.user?.uid;

    _db.collection('fila').doc(codigoMedico!+diaMesAno).snapshots().listen((snapshot) {

      nextPatientsStore.loading = true;

      nextPatientsStore.attendanceFinish = snapshot['concluido'];
      if(nextPatientsStore.attendanceFinish){
        _db.collection('funcionarios').doc(codigoMedico)
            .collection('atendimentos').doc(diaMesAno)
            .update({'disponivel':false});
      }
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

  @action
  Future<void> fetchHistoricPatient() async {

    String idPatientCurrent =
    nextPatientsStore.idPatients[
    nextPatientsStore.namePatients[nextPatientsStore.patientPosition-1]
    ]['id'];

    _db.collection('pacientes').doc(idPatientCurrent).collection('consultas').get().then((snapshot){

      listHistoric = [];

      for(int i=0; i<snapshot.docs.length;i++){
        if(snapshot.docs[i]['status']=="concluida"){
          String receita = snapshot.docs[i]['receita'].toString().replaceAll("view?usp=sharing", "preview");
          listHistoric.add(
              HistoricModel(
                  snapshot.docs[i]['nome_medico'],
                  UtilsDateTime.convertFormatDate(snapshot.docs[i]['dia_mes_ano']),
                  snapshot.docs[i]['especialidade'],
                  receita
              )
          );
        }
      }
    });
  }

}