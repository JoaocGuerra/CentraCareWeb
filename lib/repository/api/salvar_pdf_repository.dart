import 'package:centralcareweb/store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';
import 'package:centralcareweb/utils/utils_datetime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../constans/app_constants.dart';
import '../../store/medico_page/next_patients/next_patients_store.dart';

class SalvarPDFRepository{
  final NextPatientsStore nextPatientsStore = GetIt.I<NextPatientsStore>();
  final PatientOnAppointmentStore patientOnAppointmentStore = GetIt.I<PatientOnAppointmentStore>();

  final _dio = Dio();
  final _db = FirebaseFirestore.instance;

  Future<void> savePDF(String doctor, String date, int posicao, var html) async {

    Map<String, dynamic> dataPDF = <String, dynamic>{};

    String codigoPaciente = nextPatientsStore.idPatients[nextPatientsStore.namePatients[posicao-1]]['id'];

    dataPDF['codigo_medico'] = doctor;
    dataPDF['dia_mes_ano'] = date;
    dataPDF['codigo_paciente'] = codigoPaciente;
    dataPDF['html'] = html;

    try{
      final response = await _dio.post(pathLocal+pathGeneratePDF, data: dataPDF);
      _db.collection('pacientes').doc(codigoPaciente).collection('consultas').doc(doctor+date).update({
        'termino': UtilsDateTime.getHoursNow(),
        'receita': response.data
      });
    }catch(e){
      return Future.error('Erros: SalvarPDFRepository');
    }

  }

}