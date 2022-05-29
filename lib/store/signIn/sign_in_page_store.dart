import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'sign_in_page_store.g.dart';

class SignInPageStore = _SignInPageStore with _$SignInPageStore;

abstract class _SignInPageStore with Store {

  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();
  @observable
  bool isEditingEmail = false;
  @observable
  bool isEditingPassword = false;
  @observable
  bool login = false;
  @observable
  bool masterPage = false;
  @observable
  bool errorLogin = false;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  String? validateEmail(String value) {
    value = value.trim();

    if (value.isNotEmpty) {
      if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Digite um endereço de e-mail válido.';
      }
    }if (value.isEmpty){
      return 'Campo vazio.';
    }
    return null;
  }

  String? validatePassword(String value) {
    value = value.trim();
    if (value.isNotEmpty) {
      if (value.length < 6) {
        return 'O tamanho da senha deve ser maior que 6.';
      }
    }if (value.isEmpty){
      return 'Campo vazio.';
    }
    return null;
  }

  @action
  Future<void> validateLogin()async {

    login = true;
    if (validateEmail(emailController.text) == null &&
        validatePassword(passwordController.text) == null) {

      // singIn(context);
      await Future.delayed(const Duration(seconds: 2));
      masterPage = true;
      clearAllFields();

    }else{

      errorLogin = true;

    }
    login = false;

  }

  @action
  void clearAllFields(){
      emailController.text = '';
      passwordController.text = '';
      isEditingEmail = false;
      isEditingPassword = false;
      errorLogin = false;
  }

}