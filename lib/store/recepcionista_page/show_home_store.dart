import 'package:mobx/mobx.dart';

part 'show_home_store.g.dart';

class ShowHomeStore = _ShowHomeStore with _$ShowHomeStore;

abstract class _ShowHomeStore with Store {

  @observable
  int showInHome = 1;
  //1 = BuildNewAppointment, 2 = DetailsAppointments, 3 = RegisterPatient
  //4 = NewDateDoctor, 5 = DetailsDateDoctor

  @action
  void setShowInHome(int option){
    showInHome = option;
  }

}