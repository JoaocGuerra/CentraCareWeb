import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../constans/app_constants.dart';
import '../../store/recepcionista_page/new_date_doctor/doctor_store.dart';
import '../../store/recepcionista_page/new_date_doctor/new_date_doctor_store.dart';


class InsertAppointmentRepository{

  final _dio = Dio();
  final NewDateDoctorStore newDateDoctorStore =  GetIt.I<NewDateDoctorStore>();
  final DoctorsStoreNewDate doctorsStoreNewDate =  GetIt.I<DoctorsStoreNewDate>();

  Future<void> insertDate() async {

    Map<String, dynamic> dataInserAppoitment = new Map<String, dynamic>();

    dataInserAppoitment['codigo_medico'] = doctorsStoreNewDate.idDoctors[newDateDoctorStore.doctorController.text];
    dataInserAppoitment['dia_mes_ano'] = newDateDoctorStore.dataAtendimento;

    try{
      await _dio.post(pathLocal+pathInsertAppointment, data: dataInserAppoitment);
    }catch(e){
      return Future.error('Erros: InsertAppointmentRepository');
    }

  }

}