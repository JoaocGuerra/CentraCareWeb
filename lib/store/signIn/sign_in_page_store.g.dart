// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInPageStore on _SignInPageStore, Store {
  late final _$emailControllerAtom =
      Atom(name: '_SignInPageStore.emailController', context: context);

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  late final _$passwordControllerAtom =
      Atom(name: '_SignInPageStore.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$isEditingEmailAtom =
      Atom(name: '_SignInPageStore.isEditingEmail', context: context);

  @override
  bool get isEditingEmail {
    _$isEditingEmailAtom.reportRead();
    return super.isEditingEmail;
  }

  @override
  set isEditingEmail(bool value) {
    _$isEditingEmailAtom.reportWrite(value, super.isEditingEmail, () {
      super.isEditingEmail = value;
    });
  }

  late final _$isEditingPasswordAtom =
      Atom(name: '_SignInPageStore.isEditingPassword', context: context);

  @override
  bool get isEditingPassword {
    _$isEditingPasswordAtom.reportRead();
    return super.isEditingPassword;
  }

  @override
  set isEditingPassword(bool value) {
    _$isEditingPasswordAtom.reportWrite(value, super.isEditingPassword, () {
      super.isEditingPassword = value;
    });
  }

  late final _$loginAtom =
      Atom(name: '_SignInPageStore.login', context: context);

  @override
  bool get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(bool value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  late final _$masterPageAtom =
      Atom(name: '_SignInPageStore.masterPage', context: context);

  @override
  bool get masterPage {
    _$masterPageAtom.reportRead();
    return super.masterPage;
  }

  @override
  set masterPage(bool value) {
    _$masterPageAtom.reportWrite(value, super.masterPage, () {
      super.masterPage = value;
    });
  }

  late final _$errorLoginAtom =
      Atom(name: '_SignInPageStore.errorLogin', context: context);

  @override
  bool get errorLogin {
    _$errorLoginAtom.reportRead();
    return super.errorLogin;
  }

  @override
  set errorLogin(bool value) {
    _$errorLoginAtom.reportWrite(value, super.errorLogin, () {
      super.errorLogin = value;
    });
  }

  late final _$validateLoginAsyncAction =
      AsyncAction('_SignInPageStore.validateLogin', context: context);

  @override
  Future<void> validateLogin() {
    return _$validateLoginAsyncAction.run(() => super.validateLogin());
  }

  late final _$_SignInPageStoreActionController =
      ActionController(name: '_SignInPageStore', context: context);

  @override
  void clearAllFields() {
    final _$actionInfo = _$_SignInPageStoreActionController.startAction(
        name: '_SignInPageStore.clearAllFields');
    try {
      return super.clearAllFields();
    } finally {
      _$_SignInPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailController: ${emailController},
passwordController: ${passwordController},
isEditingEmail: ${isEditingEmail},
isEditingPassword: ${isEditingPassword},
login: ${login},
masterPage: ${masterPage},
errorLogin: ${errorLogin}
    ''';
  }
}
