// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShowHomeStore on _ShowHomeStore, Store {
  late final _$showInHomeReceptionistAtom =
      Atom(name: '_ShowHomeStore.showInHomeReceptionist', context: context);

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
      Atom(name: '_ShowHomeStore.showInHomeDoctor', context: context);

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

  late final _$_ShowHomeStoreActionController =
      ActionController(name: '_ShowHomeStore', context: context);

  @override
  void setShowInHomeReceptionist(int option) {
    final _$actionInfo = _$_ShowHomeStoreActionController.startAction(
        name: '_ShowHomeStore.setShowInHomeReceptionist');
    try {
      return super.setShowInHomeReceptionist(option);
    } finally {
      _$_ShowHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowInHomeDoctor(int option) {
    final _$actionInfo = _$_ShowHomeStoreActionController.startAction(
        name: '_ShowHomeStore.setShowInHomeDoctor');
    try {
      return super.setShowInHomeDoctor(option);
    } finally {
      _$_ShowHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showInHomeReceptionist: ${showInHomeReceptionist},
showInHomeDoctor: ${showInHomeDoctor}
    ''';
  }
}
