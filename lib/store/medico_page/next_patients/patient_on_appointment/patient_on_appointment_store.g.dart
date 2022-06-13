// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_on_appointment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PatientOnAppointmentStore on _PatientOnAppointmentStore, Store {
  late final _$loadingAtom =
      Atom(name: '_PatientOnAppointmentStore.loading', context: context);

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
      Atom(name: '_PatientOnAppointmentStore.namePatients', context: context);

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

  late final _$idPatientsAtom =
      Atom(name: '_PatientOnAppointmentStore.idPatients', context: context);

  @override
  Map<String, dynamic> get idPatients {
    _$idPatientsAtom.reportRead();
    return super.idPatients;
  }

  @override
  set idPatients(Map<String, dynamic> value) {
    _$idPatientsAtom.reportWrite(value, super.idPatients, () {
      super.idPatients = value;
    });
  }

  late final _$attendanceStartAtom = Atom(
      name: '_PatientOnAppointmentStore.attendanceStart', context: context);

  @override
  bool get attendanceStart {
    _$attendanceStartAtom.reportRead();
    return super.attendanceStart;
  }

  @override
  set attendanceStart(bool value) {
    _$attendanceStartAtom.reportWrite(value, super.attendanceStart, () {
      super.attendanceStart = value;
    });
  }

  late final _$fetchPatientsTodayAsyncAction = AsyncAction(
      '_PatientOnAppointmentStore.fetchPatientsToday',
      context: context);

  @override
  Future<void> fetchPatientsToday() {
    return _$fetchPatientsTodayAsyncAction
        .run(() => super.fetchPatientsToday());
  }

  late final _$_PatientOnAppointmentStoreActionController =
      ActionController(name: '_PatientOnAppointmentStore', context: context);

  @override
  dynamic setAttendanceStart(bool value) {
    final _$actionInfo = _$_PatientOnAppointmentStoreActionController
        .startAction(name: '_PatientOnAppointmentStore.setAttendanceStart');
    try {
      return super.setAttendanceStart(value);
    } finally {
      _$_PatientOnAppointmentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
namePatients: ${namePatients},
idPatients: ${idPatients},
attendanceStart: ${attendanceStart}
    ''';
  }
}
