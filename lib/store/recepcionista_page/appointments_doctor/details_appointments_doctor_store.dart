import 'package:centralcareweb/store/recepcionista_page/appointments_doctor/appointments_doctor_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../model/appointment_model.dart';
import '../../../repository/api/desmarcar_consulta_repository.dart';

part 'details_appointments_doctor_store.g.dart';

class DetailsAppointmentsDoctorStore = _DetailsAppointmentsDoctorStore with _$DetailsAppointmentsDoctorStore;

abstract class _DetailsAppointmentsDoctorStore with Store {

  @observable
  bool loading = false;

  @observable
  TextEditingController inicioController = TextEditingController();
  @observable
  TextEditingController terminoController = TextEditingController();
  @observable
  TextEditingController receitaController = TextEditingController();
  @observable
  TextEditingController statusController = TextEditingController();

  @observable
  AppointmentModel? appointmentModel;

  double maxWidthBoxConstrains = 400;

  String codigoMedico = "";
  String codigoPaciente = "";
  String diaMesAno = "";

  @action
  Future<void> fetchDetailsAppointment() async {

    FirebaseFirestore.instance.collection('pacientes').doc(codigoPaciente).collection('consultas')
        .doc(codigoMedico+diaMesAno).snapshots().listen((snapshot) async {

          loading = true;

          appointmentModel = AppointmentModel(
              codigoMedico, codigoPaciente, diaMesAno,
              snapshot.get("nome_medico"), snapshot.get("especialidade_medico"),
              snapshot.get("inicio"), snapshot.get("termino"), snapshot.get("status"), snapshot.get("receita"));

          loading = false;

    });

  }

  @action
  Future<void> updateAppointment() async {

    Map<String, dynamic> data = new Map<String, dynamic>();

    loading = true;

    if(inicioController.text.isNotEmpty) data['inicio'] = inicioController.text;
    if(terminoController.text.isNotEmpty) data['termino'] = terminoController.text;
    if(receitaController.text.isNotEmpty) data['receita'] = receitaController.text;
    if(statusController.text.isNotEmpty) data['status'] = statusController.text;

    if(data.isNotEmpty){
      await FirebaseFirestore.instance.collection('pacientes').doc(codigoPaciente).collection('consultas')
          .doc(codigoMedico+diaMesAno).update(data);
    }

    loading = false;
    clearAllFields();

  }

  @action
  Future<void> deselectQuery() async {

    try{
      loading = true;
      await DesmarcarConsultaRepository().desmarcar(appointmentModel!);
      loading = false;
    }catch(e){
      loading = false;
      print(e);
    }

  }

  @action
  void clearAllFields(){
    inicioController.text = "";
    terminoController.text = "";
    receitaController.text = "";
    statusController.text = "";
  }

}