// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_patients_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NextPatientsStore on _NextPatientsStore, Store {
  late final _$loadingAtom =
      Atom(name: '_NextPatientsStore.loading', context: context);

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

  late final _$namePatientsAtom =
      Atom(name: '_NextPatientsStore.namePatients', context: context);

  @override
  List<dynamic> get namePatients {
    _$namePatientsAtom.reportRead();
    return super.namePatients;
  }

  @override
  set namePatients(List<dynamic> value) {
    _$namePatientsAtom.reportWrite(value, super.namePatients, () {
      super.namePatients = value;
    });
  }

  late final _$fetchPatientsTodayAsyncAction =
      AsyncAction('_NextPatientsStore.fetchPatientsToday', context: context);

  @override
  Future<void> fetchPatientsToday() {
    return _$fetchPatientsTodayAsyncAction
        .run(() => super.fetchPatientsToday());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
namePatients: ${namePatients}
    ''';
  }
}
