import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../repository/firebase_firestore/insert_patient_repository.dart';

part 'register_patient_store.g.dart';

enum GenderPatient { MASCULINO, FEMININO, OUTRO }

class RegisterPatientStore = _RegisterPatientStore with _$RegisterPatientStore;

abstract class _RegisterPatientStore with Store {

  double maxWidthBoxConstrains = 600;

  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();
  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  TextEditingController lastNameController = TextEditingController();
  @observable
  TextEditingController cpfController = TextEditingController();
  @observable
  TextEditingController phoneController = TextEditingController();
  @observable
  TextEditingController birthdayController = TextEditingController();
  @observable
  String gender = "Gênero";
  @observable
  bool loading = false;
  @observable
  bool patientRegister = false;

  @action
  setGender(String name){gender = name;}

  @action
  void clearAllFields(){
    emailController.text = "";
    passwordController.text = "";
    nameController.text = "";
    lastNameController.text = "";
    cpfController.text = "";
    phoneController.text = "";
    birthdayController.text = "";
    gender = "Gênero";
  }

  @action
  Future<void> insertPatient() async {
    try{
      loading = true;
      patientRegister = false;
      await InsertPatientRepository().insertPatient();
      patientRegister = true;
      clearAllFields();
      loading = false;
    }catch(e){
      print(e);
      loading = false;
    }

  }

}