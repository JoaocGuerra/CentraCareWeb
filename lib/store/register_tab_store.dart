import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'register_tab_store.g.dart';

class RegisterTabStore = _RegisterTabStore with _$RegisterTabStore;

enum Gender { MASCULINO, FEMININO, OUTRO }
enum Function { SECRETARIA, MEDICO }

abstract class _RegisterTabStore with Store {

  double maxWidthBoxConstrains = 600;

  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  TextEditingController lastNameController = TextEditingController();
  @observable
  TextEditingController emailController = TextEditingController();
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

  @action
  setGender(String name){gender = name;}

  @action
  setFunction(String name){function = name;}


}