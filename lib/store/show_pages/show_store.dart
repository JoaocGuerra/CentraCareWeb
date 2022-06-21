import 'package:mobx/mobx.dart';

part 'show_store.g.dart';

class ShowStore = _ShowStore with _$ShowStore;

abstract class _ShowStore with Store {

  @observable
  int showInEmployeesRegister = 1;
  //1 = EmployeesList, 2 = EditEmployee

  @observable
  int showInHomeReceptionist = 1;
  //1 = BuildNewAppointment, 2 = DetailsAppointments, 3 = RegisterPatient
  //4 = NewDateDoctor, 5 = DetailsDateDoctor

  @observable
  int showInHomeDoctor = 1;
  //1 = BuildHome, 2 = BuildOnAppointmentCard, 3 = DetailsAppointmentDoctor

  @action
  void setShowInEmployeesRegister(int option){
    showInEmployeesRegister = option;
  }

  @action
  void setShowInHomeReceptionist(int option){
    showInHomeReceptionist = option;
  }

  @action
  void setShowInHomeDoctor(int option){
    showInHomeDoctor = option;
  }

}