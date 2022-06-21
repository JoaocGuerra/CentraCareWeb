import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../constans/app_constants.dart';
import '../../store/recepcionista_page/appointments_doctor/details_appointments/details_appointments_doctor_store.dart';


class UpdateQueueRepository{

  final _dio = Dio();
  final DetailsAppointmentsDoctorStore detailsAppointmentsDoctorStore =  GetIt.I<DetailsAppointmentsDoctorStore>();

  Future<void> updateQueue() async {

    Map<String, dynamic> dataUpdateQueue = new Map<String, dynamic>();
    List<String> hourSeparate = detailsAppointmentsDoctorStore.newHourIni.split(":");

    dataUpdateQueue['codigo_medico'] = detailsAppointmentsDoctorStore.appointmentModel?.codigoMedico;
    dataUpdateQueue['dia_mes_ano'] = detailsAppointmentsDoctorStore.appointmentModel?.diaMesAno;
    dataUpdateQueue['codigo_paciente'] = detailsAppointmentsDoctorStore.appointmentModel?.codigoPaciente;
    dataUpdateQueue['hora'] = int.parse(hourSeparate[0]);
    dataUpdateQueue['minuto'] = int.parse(hourSeparate[1]);


    try{
      await _dio.put(pathLocal+pathUpdateQueue, data: dataUpdateQueue);
    }catch(e){
      return Future.error('Erros: UpdateQueueRepository');
    }

  }

}