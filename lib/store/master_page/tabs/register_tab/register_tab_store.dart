import 'package:centralcareweb/repository/insert_employee_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'register_tab_store.g.dart';

enum Gender { MASCULINO, FEMININO, OUTRO }
enum Function { RECEPCIONISTA, MEDICO }

class RegisterTabStore = _RegisterTabStore with _$RegisterTabStore;

abstract class _RegisterTabStore with Store {

  double maxWidthBoxConstrains = 600;

  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  TextEditingController lastNameController = TextEditingController();
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();
  @observable
  TextEditingController cpfController = TextEditingController();
  @observable
  TextEditingController birthdayController = TextEditingController();
  @observable
  TextEditingController specialtyController = TextEditingController();
  @observable
  String gender = "Gênero";
  @observable
  String function = "Função";
  @observable
  bool loading = false;
  @observable
  bool userRegister = false;

  @action
  setGender(String name){gender = name;}

  @action
  setFunction(String name){function = name;}

  @action
  void clearAllFields(){
    nameController.text = "";
    lastNameController.text = "";
    emailController.text = "";
    passwordController.text = "";
    cpfController.text = "";
    birthdayController.text = "";
    gender = "Gênero";
    function = "Função";
    specialtyController.text = "";
  }

  @action
  Future<void> insertEmployee() async {
    try{
      loading = true;
      userRegister = false;
      await InsertEmployeeRepository().insertEmployee();
      userRegister = true;
      clearAllFields();
      loading = false;
    }catch(e){
      print(e);
      loading = false;
    }

  }

}