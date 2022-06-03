import 'package:centralcareweb/model/appointment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../constans/app_constants.dart';
import '../../store/recepcionista_page/appointments_doctor/appointments_doctor_store.dart';

class DesmarcarConsultaRepository{

  final _dio = Dio();
  final _db = FirebaseFirestore.instance;
  final AppointmentsDoctorStore appointmentsDoctorStore =  GetIt.I<AppointmentsDoctorStore>();

  Future<void> desmarcar(AppointmentModel appointmentModel) async {

    Map<String, dynamic> mapDelete = new Map<String, dynamic>();

    mapDelete["codigo_medico"] = appointmentModel.codigoMedico;
    mapDelete["dia_mes_ano"] = appointmentModel.diaMesAno;
    mapDelete["codigo_paciente"] = appointmentModel.codigoPaciente;

    try{
      await _dio.delete(pathLocal + pathDeselectQuery, data: mapDelete);
      appointmentsDoctorStore.setShowDetailsAppointment(false);
    }catch(err){
      print(err);
    }


  }

}