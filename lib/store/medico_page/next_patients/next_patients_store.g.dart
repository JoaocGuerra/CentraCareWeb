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

  late final _$loadingBuildNextPatientsAtom = Atom(
      name: '_NextPatientsStore.loadingBuildNextPatients', context: context);

  @override
  bool get loadingBuildNextPatients {
    _$loadingBuildNextPatientsAtom.reportRead();
    return super.loadingBuildNextPatients;
  }

  @override
  set loadingBuildNextPatients(bool value) {
    _$loadingBuildNextPatientsAtom
        .reportWrite(value, super.loadingBuildNextPatients, () {
      super.loadingBuildNextPatients = value;
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

  late final _$idPatientsAtom =
      Atom(name: '_NextPatientsStore.idPatients', context: context);

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

  late final _$patientPositionAtom =
      Atom(name: '_NextPatientsStore.patientPosition', context: context);

  @override
  int get patientPosition {
    _$patientPositionAtom.reportRead();
    return super.patientPosition;
  }

  @override
  set patientPosition(int value) {
    _$patientPositionAtom.reportWrite(value, super.patientPosition, () {
      super.patientPosition = value;
    });
  }

  late final _$attendanceStartAtom =
      Atom(name: '_NextPatientsStore.attendanceStart', context: context);

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

  late final _$attendanceFinishAtom =
      Atom(name: '_NextPatientsStore.attendanceFinish', context: context);

  @override
  bool get attendanceFinish {
    _$attendanceFinishAtom.reportRead();
    return super.attendanceFinish;
  }

  @override
  set attendanceFinish(bool value) {
    _$attendanceFinishAtom.reportWrite(value, super.attendanceFinish, () {
      super.attendanceFinish = value;
    });
  }

  late final _$fetchPatientsTodayAsyncAction =
      AsyncAction('_NextPatientsStore.fetchPatientsToday', context: context);

  @override
  Future<void> fetchPatientsToday() {
    return _$fetchPatientsTodayAsyncAction
        .run(() => super.fetchPatientsToday());
  }

  late final _$fetchAttendanceStartAsyncAction =
      AsyncAction('_NextPatientsStore.fetchAttendanceStart', context: context);

  @override
  Future<void> fetchAttendanceStart() {
    return _$fetchAttendanceStartAsyncAction
        .run(() => super.fetchAttendanceStart());
  }

  late final _$fetchNextPatientAsyncAction =
      AsyncAction('_NextPatientsStore.fetchNextPatient', context: context);

  @override
  Future<void> fetchNextPatient(dynamic txt) {
    return _$fetchNextPatientAsyncAction.run(() => super.fetchNextPatient(txt));
  }

  late final _$_NextPatientsStoreActionController =
      ActionController(name: '_NextPatientsStore', context: context);

  @override
  dynamic setAttendanceStart(bool value) {
    final _$actionInfo = _$_NextPatientsStoreActionController.startAction(
        name: '_NextPatientsStore.setAttendanceStart');
    try {
      return super.setAttendanceStart(value);
    } finally {
      _$_NextPatientsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
loadingBuildNextPatients: ${loadingBuildNextPatients},
namePatients: ${namePatients},
idPatients: ${idPatients},
patientPosition: ${patientPosition},
attendanceStart: ${attendanceStart},
attendanceFinish: ${attendanceFinish}
    ''';
  }
}
