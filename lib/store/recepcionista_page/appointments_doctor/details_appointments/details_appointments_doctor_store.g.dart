// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_appointments_doctor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsAppointmentsDoctorStore
    on _DetailsAppointmentsDoctorStore, Store {
  late final _$loadingAtom =
      Atom(name: '_DetailsAppointmentsDoctorStore.loading', context: context);

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

  late final _$changeHoursAtom = Atom(
      name: '_DetailsAppointmentsDoctorStore.changeHours', context: context);

  @override
  bool get changeHours {
    _$changeHoursAtom.reportRead();
    return super.changeHours;
  }

  @override
  set changeHours(bool value) {
    _$changeHoursAtom.reportWrite(value, super.changeHours, () {
      super.changeHours = value;
    });
  }

  late final _$inicioControllerAtom = Atom(
      name: '_DetailsAppointmentsDoctorStore.inicioController',
      context: context);

  @override
  TextEditingController get inicioController {
    _$inicioControllerAtom.reportRead();
    return super.inicioController;
  }

  @override
  set inicioController(TextEditingController value) {
    _$inicioControllerAtom.reportWrite(value, super.inicioController, () {
      super.inicioController = value;
    });
  }

  late final _$terminoControllerAtom = Atom(
      name: '_DetailsAppointmentsDoctorStore.terminoController',
      context: context);

  @override
  TextEditingController get terminoController {
    _$terminoControllerAtom.reportRead();
    return super.terminoController;
  }

  @override
  set terminoController(TextEditingController value) {
    _$terminoControllerAtom.reportWrite(value, super.terminoController, () {
      super.terminoController = value;
    });
  }

  late final _$receitaControllerAtom = Atom(
      name: '_DetailsAppointmentsDoctorStore.receitaController',
      context: context);

  @override
  TextEditingController get receitaController {
    _$receitaControllerAtom.reportRead();
    return super.receitaController;
  }

  @override
  set receitaController(TextEditingController value) {
    _$receitaControllerAtom.reportWrite(value, super.receitaController, () {
      super.receitaController = value;
    });
  }

  late final _$statusControllerAtom = Atom(
      name: '_DetailsAppointmentsDoctorStore.statusController',
      context: context);

  @override
  TextEditingController get statusController {
    _$statusControllerAtom.reportRead();
    return super.statusController;
  }

  @override
  set statusController(TextEditingController value) {
    _$statusControllerAtom.reportWrite(value, super.statusController, () {
      super.statusController = value;
    });
  }

  late final _$appointmentModelAtom = Atom(
      name: '_DetailsAppointmentsDoctorStore.appointmentModel',
      context: context);

  @override
  AppointmentModel? get appointmentModel {
    _$appointmentModelAtom.reportRead();
    return super.appointmentModel;
  }

  @override
  set appointmentModel(AppointmentModel? value) {
    _$appointmentModelAtom.reportWrite(value, super.appointmentModel, () {
      super.appointmentModel = value;
    });
  }

  late final _$newHourIniAtom = Atom(
      name: '_DetailsAppointmentsDoctorStore.newHourIni', context: context);

  @override
  String get newHourIni {
    _$newHourIniAtom.reportRead();
    return super.newHourIni;
  }

  @override
  set newHourIni(String value) {
    _$newHourIniAtom.reportWrite(value, super.newHourIni, () {
      super.newHourIni = value;
    });
  }

  late final _$fetchDetailsAppointmentAsyncAction = AsyncAction(
      '_DetailsAppointmentsDoctorStore.fetchDetailsAppointment',
      context: context);

  @override
  Future<void> fetchDetailsAppointment() {
    return _$fetchDetailsAppointmentAsyncAction
        .run(() => super.fetchDetailsAppointment());
  }

  late final _$updateAppointmentAsyncAction = AsyncAction(
      '_DetailsAppointmentsDoctorStore.updateAppointment',
      context: context);

  @override
  Future<void> updateAppointment() {
    return _$updateAppointmentAsyncAction.run(() => super.updateAppointment());
  }

  late final _$deselectQueryAsyncAction = AsyncAction(
      '_DetailsAppointmentsDoctorStore.deselectQuery',
      context: context);

  @override
  Future<void> deselectQuery() {
    return _$deselectQueryAsyncAction.run(() => super.deselectQuery());
  }

  late final _$_DetailsAppointmentsDoctorStoreActionController =
      ActionController(
          name: '_DetailsAppointmentsDoctorStore', context: context);

  @override
  void setSelectedHour(String hour) {
    final _$actionInfo = _$_DetailsAppointmentsDoctorStoreActionController
        .startAction(name: '_DetailsAppointmentsDoctorStore.setSelectedHour');
    try {
      return super.setSelectedHour(hour);
    } finally {
      _$_DetailsAppointmentsDoctorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChangeHours(bool value) {
    final _$actionInfo = _$_DetailsAppointmentsDoctorStoreActionController
        .startAction(name: '_DetailsAppointmentsDoctorStore.setChangeHours');
    try {
      return super.setChangeHours(value);
    } finally {
      _$_DetailsAppointmentsDoctorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAllFields() {
    final _$actionInfo = _$_DetailsAppointmentsDoctorStoreActionController
        .startAction(name: '_DetailsAppointmentsDoctorStore.clearAllFields');
    try {
      return super.clearAllFields();
    } finally {
      _$_DetailsAppointmentsDoctorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
changeHours: ${changeHours},
inicioController: ${inicioController},
terminoController: ${terminoController},
receitaController: ${receitaController},
statusController: ${statusController},
appointmentModel: ${appointmentModel},
newHourIni: ${newHourIni}
    ''';
  }
}
