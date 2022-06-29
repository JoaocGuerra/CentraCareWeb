// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_patient_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterPatientStore on _RegisterPatientStore, Store {
  late final _$emailControllerAtom =
      Atom(name: '_RegisterPatientStore.emailController', context: context);

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
      Atom(name: '_RegisterPatientStore.passwordController', context: context);

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

  late final _$nameControllerAtom =
      Atom(name: '_RegisterPatientStore.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$lastNameControllerAtom =
      Atom(name: '_RegisterPatientStore.lastNameController', context: context);

  @override
  TextEditingController get lastNameController {
    _$lastNameControllerAtom.reportRead();
    return super.lastNameController;
  }

  @override
  set lastNameController(TextEditingController value) {
    _$lastNameControllerAtom.reportWrite(value, super.lastNameController, () {
      super.lastNameController = value;
    });
  }

  late final _$cpfControllerAtom =
      Atom(name: '_RegisterPatientStore.cpfController', context: context);

  @override
  TextEditingController get cpfController {
    _$cpfControllerAtom.reportRead();
    return super.cpfController;
  }

  @override
  set cpfController(TextEditingController value) {
    _$cpfControllerAtom.reportWrite(value, super.cpfController, () {
      super.cpfController = value;
    });
  }

  late final _$phoneControllerAtom =
      Atom(name: '_RegisterPatientStore.phoneController', context: context);

  @override
  TextEditingController get phoneController {
    _$phoneControllerAtom.reportRead();
    return super.phoneController;
  }

  @override
  set phoneController(TextEditingController value) {
    _$phoneControllerAtom.reportWrite(value, super.phoneController, () {
      super.phoneController = value;
    });
  }

  late final _$birthdayControllerAtom =
      Atom(name: '_RegisterPatientStore.birthdayController', context: context);

  @override
  TextEditingController get birthdayController {
    _$birthdayControllerAtom.reportRead();
    return super.birthdayController;
  }

  @override
  set birthdayController(TextEditingController value) {
    _$birthdayControllerAtom.reportWrite(value, super.birthdayController, () {
      super.birthdayController = value;
    });
  }

  late final _$genderAtom =
      Atom(name: '_RegisterPatientStore.gender', context: context);

  @override
  String get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_RegisterPatientStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$patientRegisterAtom =
      Atom(name: '_RegisterPatientStore.patientRegister', context: context);

  @override
  bool get patientRegister {
    _$patientRegisterAtom.reportRead();
    return super.patientRegister;
  }

  @override
  set patientRegister(bool value) {
    _$patientRegisterAtom.reportWrite(value, super.patientRegister, () {
      super.patientRegister = value;
    });
  }

  late final _$insertPatientAsyncAction =
      AsyncAction('_RegisterPatientStore.insertPatient', context: context);

  @override
  Future<void> insertPatient() {
    return _$insertPatientAsyncAction.run(() => super.insertPatient());
  }

  late final _$_RegisterPatientStoreActionController =
      ActionController(name: '_RegisterPatientStore', context: context);

  @override
  dynamic setGender(String name) {
    final _$actionInfo = _$_RegisterPatientStoreActionController.startAction(
        name: '_RegisterPatientStore.setGender');
    try {
      return super.setGender(name);
    } finally {
      _$_RegisterPatientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAllFields() {
    final _$actionInfo = _$_RegisterPatientStoreActionController.startAction(
        name: '_RegisterPatientStore.clearAllFields');
    try {
      return super.clearAllFields();
    } finally {
      _$_RegisterPatientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailController: ${emailController},
passwordController: ${passwordController},
nameController: ${nameController},
lastNameController: ${lastNameController},
cpfController: ${cpfController},
phoneController: ${phoneController},
birthdayController: ${birthdayController},
gender: ${gender},
loading: ${loading},
patientRegister: ${patientRegister}
    ''';
  }
}
