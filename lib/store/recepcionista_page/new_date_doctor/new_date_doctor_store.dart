import 'package:centralcareweb/repository/api/insert_appointment_repository.dart';
import 'package:centralcareweb/repository/firebase_firestore/insert_employee_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../repository/firebase_firestore/insert_new_date_doctor_repository.dart';

part 'new_date_doctor_store.g.dart';

class NewDateDoctorStore = _NewDateDoctorStore with _$NewDateDoctorStore;

abstract class _NewDateDoctorStore with Store {

  double maxWidth = 400;

  TextEditingController doctorController = TextEditingController();

  @observable
  String dataAtendimento = "";

  @observable
  String inicioAtendimento = "08:00";
  @action
  void setInicioAtendimento(String time){
    inicioAtendimento = time;
  }

  @observable
  String finalAtendimento = "18:00";
  @action
  void setFinalAtendimento(String time){
    finalAtendimento = time;
  }

  @observable
  List<String> horasIndisponiveis = [];
  @action
  void setHorasIndisponiveis(String horario){
    if(!horasIndisponiveis.contains(horario) && horario.isNotEmpty) {
      horasIndisponiveis = List.from(horasIndisponiveis..add(horario));
    }
  }

  @observable
  String horaSelecionada = "";
  void setHoraSelecioanda(String time){
    horaSelecionada = time;
  }

  TextEditingController intervaloController = TextEditingController();

  @observable
  bool loading = false;
  @observable
  bool dateRegister = false;

  @computed
  bool get isFilled {
    if ((dataAtendimento.isEmpty)
    ) {
      return false;
    }
    return true;
  }

  @action
  void clearAllFields(){
    dataAtendimento = "";
    inicioAtendimento = "08:00";
    finalAtendimento = "18:00";
    horasIndisponiveis = [];
    horaSelecionada = "";
    doctorController.text = "";
    intervaloController.text = "";
  }

  @action
  Future<void> insertNewDate() async {
    try{
      loading = true;
      dateRegister = false;
      await InsertNewDateDoctorRepository().insertDate();
      await InsertAppointmentRepository().insertDate();
      dateRegister = true;
      clearAllFields();
      loading = false;
    }catch(e){
      print(e);
      loading = false;
    }

  }

}