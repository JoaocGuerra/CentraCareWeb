// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShowHomeStore on _ShowHomeStore, Store {
  late final _$showInHomeAtom =
      Atom(name: '_ShowHomeStore.showInHome', context: context);

  @override
  int get showInHome {
    _$showInHomeAtom.reportRead();
    return super.showInHome;
  }

  @override
  set showInHome(int value) {
    _$showInHomeAtom.reportWrite(value, super.showInHome, () {
      super.showInHome = value;
    });
  }

  late final _$_ShowHomeStoreActionController =
      ActionController(name: '_ShowHomeStore', context: context);

  @override
  void setShowInHome(int option) {
    final _$actionInfo = _$_ShowHomeStoreActionController.startAction(
        name: '_ShowHomeStore.setShowInHome');
    try {
      return super.setShowInHome(option);
    } finally {
      _$_ShowHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showInHome: ${showInHome}
    ''';
  }
}
