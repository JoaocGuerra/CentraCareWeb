import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/doctor_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/new_date_doctor_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import '../../store/recepcionista_page/register_patient/register_patient_store.dart';

class InsertNewDateDoctorRepository{

  final _db = FirebaseFirestore.instance;
  final NewDateDoctorStore newDateDoctorStore =  GetIt.I<NewDateDoctorStore>();
  final DoctorsStoreNewDate doctorsStoreNewDate =  GetIt.I<DoctorsStoreNewDate>();

  Future<void> insertDate()async {

    Map<String, dynamic> mapInsert = Map<String, dynamic>();

    mapInsert['disponivel'] = true;
    mapInsert['inicio'] = newDateDoctorStore.inicioAtendimento;
    mapInsert['fim'] = newDateDoctorStore.finalAtendimento;
    mapInsert['intervalo'] = int.parse(newDateDoctorStore.intervaloController.text);
    mapInsert['horarios_indisponiveis'] = newDateDoctorStore.horasIndisponiveis;
    mapInsert['pacientes'] = [];

    await _db.collection('funcionarios')
        .doc(doctorsStoreNewDate.idDoctors[newDateDoctorStore.doctorController.text])
        .collection('atendimentos').doc(newDateDoctorStore.dataAtendimento).set(mapInsert);
  }


}