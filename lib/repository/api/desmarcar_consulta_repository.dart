import 'package:centralcareweb/model/appointment_model.dart';
import 'package:centralcareweb/store/recepcionista_page/show_home_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../constans/app_constants.dart';
import '../../store/recepcionista_page/appointments_doctor/appointments_doctor_store.dart';

class DesmarcarConsultaRepository{

  final _dio = Dio();
  final _db = FirebaseFirestore.instance;
  final ShowHomeStore showHomeStore =  GetIt.I<ShowHomeStore>();

  Future<void> desmarcar(AppointmentModel appointmentModel) async {

    Map<String, dynamic> mapDelete = new Map<String, dynamic>();

    mapDelete["codigo_medico"] = appointmentModel.codigoMedico;
    mapDelete["dia_mes_ano"] = appointmentModel.diaMesAno;
    mapDelete["codigo_paciente"] = appointmentModel.codigoPaciente;

    try{
      await _dio.delete(pathLocal + pathDeselectQuery, data: mapDelete);
      showHomeStore.setShowDetailsAppointment(1);
    }catch(err){
      print(err);
    }


  }

}