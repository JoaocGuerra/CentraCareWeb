import 'package:mobx/mobx.dart';

part 'show_home_store.g.dart';

class ShowHomeStore = _ShowHomeStore with _$ShowHomeStore;

abstract class _ShowHomeStore with Store {

  @observable
  int showInHomeReceptionist = 1;
  //1 = BuildNewAppointment, 2 = DetailsAppointments, 3 = RegisterPatient
  //4 = NewDateDoctor, 5 = DetailsDateDoctor

  @observable
  int showInHomeDoctor = 1;
  //1 = BuildHome, 2 = BuildOnAppointmentCard, 3 = DetailsAppointmentDoctor

  @action
  void setShowInHomeReceptionist(int option){
    showInHomeReceptionist = option;
  }

  @action
  void setShowInHomeDoctor(int option){
    showInHomeDoctor = option;
  }

}