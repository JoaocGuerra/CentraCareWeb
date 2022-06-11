import 'package:centralcareweb/model/appointment_model.dart';
import 'package:centralcareweb/store/show_pages/show_home_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../constans/app_constants.dart';
import '../../store/recepcionista_page/appointments_doctor/appointments_doctor_store.dart';

class DesmarcarConsultaRepository{

  final _dio = Dio();
  final _db = FirebaseFirestore.instance;

  Future<void> desmarcar(String codigoMedico, String diaMesAno, String codigoPaciente) async {

    _db.collection('pacientes')
        .doc(codigoPaciente)
        .collection('consultas')
        .doc(codigoMedico+diaMesAno).delete();

    _db.collection('funcionarios')
        .doc(codigoMedico)
        .collection('atendimentos')
        .doc(diaMesAno)
        .snapshots().listen((snapshot) {

          List<dynamic> pacientes = snapshot['pacientes'];
          pacientes.remove(codigoPaciente);

          Map<String, dynamic> mapUpdate = Map<String, dynamic>();
          mapUpdate['pacientes'] = pacientes;

          _db.collection('funcionarios')
              .doc(codigoMedico)
              .collection('atendimentos')
              .doc(diaMesAno).update(mapUpdate);

    });

    Map<String, dynamic> mapDelete = new Map<String, dynamic>();

    mapDelete["codigo_medico"] = codigoMedico;
    mapDelete["dia_mes_ano"] = diaMesAno;
    mapDelete["codigo_paciente"] = codigoPaciente;

    try{
      await _dio.delete(pathLocal + pathDeselectQuery, data: mapDelete);
    }catch(err){
      print(err);
    }


  }

}