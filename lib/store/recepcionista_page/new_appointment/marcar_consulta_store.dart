import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../repository/api/insert_queue_repository.dart';

part 'marcar_consulta_store.g.dart';

class MarcarConsultaStore = _MarcarConsultaStore with _$MarcarConsultaStore;

abstract class _MarcarConsultaStore with Store {

  double maxWidth = 400;

  @observable
  TextEditingController userController = TextEditingController();

  @observable
  List<dynamic> selectedSpecialty = <dynamic>[];
  @action
  void setSelectedSpecialty(List<dynamic> value) {selectedSpecialty = value;}

  @observable
  String selectedDoctor = "";
  @action
  void setSelectedDoctor(String value) {selectedDoctor = value;}


  @observable
  String nameDoctor = "";
  @action
  void setNameDoctor(String value) {nameDoctor = value;}

  @observable
  String specialtyDoctor = "";
  @action
  void setSpecialtyDoctor(String value) {specialtyDoctor = value;}

  @observable
  String selectedDate = "";
  @action
  void setSelectedDate(String value) {selectedDate = value;}

  @observable
  String selectedHour = "";
  @action
  void setSelectedHour(String value) {selectedHour = value;}

  @observable
  bool loadingNewAppointmentPage = false;

  @observable
  bool appointmentRegister = false;

  @computed
  bool get isFilled {
    if ((selectedSpecialty.isEmpty) ||
        (selectedDoctor.isEmpty) ||
        (selectedDate.isEmpty) ||
        (selectedHour.isEmpty)
    ) {
      return false;
    }
    return true;
  }

  @action
  void clearFieldsSpecialty(){
    setSelectedDoctor("");
    setNameDoctor("");
    setSelectedDate("");
    setSelectedHour("");
  }

  @action
  void clearFieldsDoctor(){
    setSelectedDate("");
    setSelectedHour("");
  }

  @action
  void clearFieldsDate(){
    setSelectedHour("");
  }

  @action
  void clearAllFields(){
    setSelectedSpecialty([]);
    setSelectedDoctor("");
    setNameDoctor("");
    setSpecialtyDoctor("");
    setSelectedDate("");
    setSelectedHour("");
    userController.text = "";
  }

  @action
  Future<void> insertQueue() async{

    try{
      loadingNewAppointmentPage = true;
      appointmentRegister = false;
      await InsertQueueRepository().insertQueue();
      appointmentRegister = true;
      loadingNewAppointmentPage = false;
    }catch (e){
      loadingNewAppointmentPage = false;
      print(e);
    }
  }

}