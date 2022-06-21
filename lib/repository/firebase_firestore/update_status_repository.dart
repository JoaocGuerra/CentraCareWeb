import 'package:centralcareweb/store/auth/auth_store.dart';
import 'package:centralcareweb/store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';
import 'package:centralcareweb/utils/utils_datetime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../../store/medico_page/next_patients/next_patients_store.dart';

class UpdateStatusRepository{

  final _db = FirebaseFirestore.instance;
  final NextPatientsStore nextPatientsStore = GetIt.I<NextPatientsStore>();
  final PatientOnAppointmentStore patientOnAppointmentStore = GetIt.I<PatientOnAppointmentStore>();
  final AuthStore authStore = GetIt.I<AuthStore>();

  Future<void> updateQueryInitial()async {

    String? codigoMedico = authStore.user?.uid;
    String diaMesAno = UtilsDateTime.getDatetimeNow();
    String idPatientCurrent =
    nextPatientsStore.idPatients[
    nextPatientsStore.namePatients[nextPatientsStore.patientPosition-1]
    ]['id'];

    if(codigoMedico!=null){
      _db.collection('pacientes')
          .doc(idPatientCurrent)
          .collection('consultas')
          .doc(codigoMedico+diaMesAno)
          .update({'status':'iniciada'});
    }

    patientOnAppointmentStore.setAppointmentInitial(true);

  }


}