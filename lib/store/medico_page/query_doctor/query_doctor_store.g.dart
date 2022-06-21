// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_doctor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QueryDoctorStore on _QueryDoctorStore, Store {
  late final _$loadingAtom =
      Atom(name: '_QueryDoctorStore.loading', context: context);

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

  late final _$namesQuerysAtom =
      Atom(name: '_QueryDoctorStore.namesQuerys', context: context);

  @override
  List<dynamic> get namesQuerys {
    _$namesQuerysAtom.reportRead();
    return super.namesQuerys;
  }

  @override
  set namesQuerys(List<dynamic> value) {
    _$namesQuerysAtom.reportWrite(value, super.namesQuerys, () {
      super.namesQuerys = value;
    });
  }

  late final _$querysAtom =
      Atom(name: '_QueryDoctorStore.querys', context: context);

  @override
  Map<String, dynamic> get querys {
    _$querysAtom.reportRead();
    return super.querys;
  }

  @override
  set querys(Map<String, dynamic> value) {
    _$querysAtom.reportWrite(value, super.querys, () {
      super.querys = value;
    });
  }

  late final _$fetchQueryDoctorAsyncAction =
      AsyncAction('_QueryDoctorStore.fetchQueryDoctor', context: context);

  @override
  Future<void> fetchQueryDoctor() {
    return _$fetchQueryDoctorAsyncAction.run(() => super.fetchQueryDoctor());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
namesQuerys: ${namesQuerys},
querys: ${querys}
    ''';
  }
}
