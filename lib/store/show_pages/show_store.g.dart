// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShowStore on _ShowStore, Store {
  late final _$showInEmployeesRegisterAtom =
      Atom(name: '_ShowStore.showInEmployeesRegister', context: context);

  @override
  int get showInEmployeesRegister {
    _$showInEmployeesRegisterAtom.reportRead();
    return super.showInEmployeesRegister;
  }

  @override
  set showInEmployeesRegister(int value) {
    _$showInEmployeesRegisterAtom
        .reportWrite(value, super.showInEmployeesRegister, () {
      super.showInEmployeesRegister = value;
    });
  }

  late final _$showInHomeReceptionistAtom =
      Atom(name: '_ShowStore.showInHomeReceptionist', context: context);

  @override
  int get showInHomeReceptionist {
    _$showInHomeReceptionistAtom.reportRead();
    return super.showInHomeReceptionist;
  }

  @override
  set showInHomeReceptionist(int value) {
    _$showInHomeReceptionistAtom
        .reportWrite(value, super.showInHomeReceptionist, () {
      super.showInHomeReceptionist = value;
    });
  }

  late final _$showInHomeDoctorAtom =
      Atom(name: '_ShowStore.showInHomeDoctor', context: context);

  @override
  int get showInHomeDoctor {
    _$showInHomeDoctorAtom.reportRead();
    return super.showInHomeDoctor;
  }

  @override
  set showInHomeDoctor(int value) {
    _$showInHomeDoctorAtom.reportWrite(value, super.showInHomeDoctor, () {
      super.showInHomeDoctor = value;
    });
  }

  late final _$_ShowStoreActionController =
      ActionController(name: '_ShowStore', context: context);

  @override
  void setShowInEmployeesRegister(int option) {
    final _$actionInfo = _$_ShowStoreActionController.startAction(
        name: '_ShowStore.setShowInEmployeesRegister');
    try {
      return super.setShowInEmployeesRegister(option);
    } finally {
      _$_ShowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowInHomeReceptionist(int option) {
    final _$actionInfo = _$_ShowStoreActionController.startAction(
        name: '_ShowStore.setShowInHomeReceptionist');
    try {
      return super.setShowInHomeReceptionist(option);
    } finally {
      _$_ShowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowInHomeDoctor(int option) {
    final _$actionInfo = _$_ShowStoreActionController.startAction(
        name: '_ShowStore.setShowInHomeDoctor');
    try {
      return super.setShowInHomeDoctor(option);
    } finally {
      _$_ShowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showInEmployeesRegister: ${showInEmployeesRegister},
showInHomeReceptionist: ${showInHomeReceptionist},
showInHomeDoctor: ${showInHomeDoctor}
    ''';
  }
}
