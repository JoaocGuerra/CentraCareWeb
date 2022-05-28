// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_tab_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterTabStore on _RegisterTabStore, Store {
  late final _$nameControllerAtom =
      Atom(name: '_RegisterTabStore.nameController', context: context);

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
      Atom(name: '_RegisterTabStore.lastNameController', context: context);

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

  late final _$emailControllerAtom =
      Atom(name: '_RegisterTabStore.emailController', context: context);

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

  late final _$cpfControllerAtom =
      Atom(name: '_RegisterTabStore.cpfController', context: context);

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

  late final _$birthdayControllerAtom =
      Atom(name: '_RegisterTabStore.birthdayController', context: context);

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

  late final _$specialtyControllerAtom =
      Atom(name: '_RegisterTabStore.specialtyController', context: context);

  @override
  TextEditingController get specialtyController {
    _$specialtyControllerAtom.reportRead();
    return super.specialtyController;
  }

  @override
  set specialtyController(TextEditingController value) {
    _$specialtyControllerAtom.reportWrite(value, super.specialtyController, () {
      super.specialtyController = value;
    });
  }

  late final _$genderAtom =
      Atom(name: '_RegisterTabStore.gender', context: context);

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

  late final _$functionAtom =
      Atom(name: '_RegisterTabStore.function', context: context);

  @override
  String get function {
    _$functionAtom.reportRead();
    return super.function;
  }

  @override
  set function(String value) {
    _$functionAtom.reportWrite(value, super.function, () {
      super.function = value;
    });
  }

  @override
  String toString() {
    return '''
nameController: ${nameController},
lastNameController: ${lastNameController},
emailController: ${emailController},
cpfController: ${cpfController},
birthdayController: ${birthdayController},
specialtyController: ${specialtyController},
gender: ${gender},
function: ${function}
    ''';
  }
}
