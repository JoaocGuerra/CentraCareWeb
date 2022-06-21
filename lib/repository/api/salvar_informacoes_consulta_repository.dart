import 'package:centralcareweb/model/prontuario_model.dart';
import 'package:centralcareweb/store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';
import 'package:centralcareweb/utils/utils_datetime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../constans/app_constants.dart';
import '../../store/medico_page/next_patients/next_patients_store.dart';

class SalvarInformacoesConsultaRepository{
  final NextPatientsStore nextPatientsStore = GetIt.I<NextPatientsStore>();
  final PatientOnAppointmentStore patientOnAppointmentStore = GetIt.I<PatientOnAppointmentStore>();

  final _dio = Dio();
  final _db = FirebaseFirestore.instance;

  Future<void> save(String doctor, String date, int posicao, var html) async {

    Map<String, dynamic> dataPDF = <String, dynamic>{};

    String codigoPaciente = nextPatientsStore.idPatients[nextPatientsStore.namePatients[posicao-1]]['id'];

    dataPDF['codigo_medico'] = doctor;
    dataPDF['dia_mes_ano'] = date;
    dataPDF['codigo_paciente'] = codigoPaciente;
    dataPDF['html'] = html;

    ProntruarioModel prontuario =
    ProntruarioModel(
      patientOnAppointmentStore.queixaPrincipalController.text,
      patientOnAppointmentStore.historiaDoencaAtualController.text,
      patientOnAppointmentStore.revisaoSitemasController.text,
      patientOnAppointmentStore.historiaMedicaPregressaController.text,
      patientOnAppointmentStore.historiaFamiliarController.text,
      patientOnAppointmentStore.perfilPsicossoialController.text,
      patientOnAppointmentStore.sinaisVitaisController.text,
      patientOnAppointmentStore.avaliacoesController.text,
    );
    patientOnAppointmentStore.clearAllFields();

    try{
      final response = await _dio.post(pathLocal+pathGeneratePDF, data: dataPDF);
      await _db.collection('pacientes').doc(codigoPaciente).collection('consultas').doc(doctor+date).update({
        'termino': UtilsDateTime.getHoursNow(),
        'receita': await response.data,
        'queixa_principal': prontuario.queixaPrincipal,
        'historia_da_doenca_atual': prontuario.historiaDoencaAtual,
        'revisao_de_sistemas': prontuario.revisaoDeSistemas,
        'historia_medica_pregressa': prontuario.historiaMedicaPregressa,
        'historia_familiar': prontuario.historiaFamiliar,
        'perfil_psicossocial': prontuario.perfilPsicossocial,
        'sinais_vitais': prontuario.sinaisVitais,
        'avaliacoes': prontuario.avaliacoes,
      });
    }catch(e){
      return Future.error('Erros: SalvarPDFRepository');
    }

  }

}