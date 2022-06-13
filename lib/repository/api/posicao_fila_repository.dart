import 'package:dio/dio.dart';

import '../../constans/app_constants.dart';


class PosicaoFilaRepository{
  final _dio = Dio();

  Future<String> fetchPositionQueue(String doctor, String date, String codigoPaciente) async{

    Response responseReadPositionQueue = await _dio.get(pathLocal+pathReadPositionQueue+'/'+doctor+'/'+date+'/'+codigoPaciente);

    var responseBodyReadPositionQueue = Map<String, dynamic>.from(responseReadPositionQueue.data);

    return responseBodyReadPositionQueue['posicao'].toString();

  }

  Future<String> fetchPositionInAttendance(String doctor, String date) async{

    Response responseReadPositionQueueAppointment = await _dio.get(pathLocal+pathReadPositionQueueAppointment+'/'+doctor+'/'+date);

    var responseBodyReadPositionQueueAppointment = Map<String, dynamic>.from(responseReadPositionQueueAppointment.data);

    if(responseBodyReadPositionQueueAppointment['paciente'] == 0){
      return "fechado";
    }else{
      var positionCurrent = responseBodyReadPositionQueueAppointment['paciente'];

      return positionCurrent.toString();
    }

  }

  Future<void> updatePatientAnswered(String doctor, String date, int posicao) async{

    Map<String, dynamic> dataUpdatePatientAnswered = <String, dynamic>{};

    dataUpdatePatientAnswered['codigo_medico'] = doctor;
    dataUpdatePatientAnswered['dia_mes_ano'] = date;
    dataUpdatePatientAnswered['posicao_paciente_atendido'] = posicao;

    try{
      await _dio.put(pathLocal+pathUpdatePatientAnswered, data: dataUpdatePatientAnswered);
    }catch(e){
      return Future.error('Erros: PosicaoFilaRepository.updatePatientAnswered');
    }

  }

}