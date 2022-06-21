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

  late final _$appointmentInitialAtom = Atom(
      name: '_PatientOnAppointmentStore.appointmentInitial', context: context);

  @override
  bool get appointmentInitial {
    _$appointmentInitialAtom.reportRead();
    return super.appointmentInitial;
  }

  @override
  set appointmentInitial(bool value) {
    _$appointmentInitialAtom.reportWrite(value, super.appointmentInitial, () {
      super.appointmentInitial = value;
    });
  }

  late final _$patientOnAppointmentAtom = Atom(
      name: '_PatientOnAppointmentStore.patientOnAppointment',
      context: context);

  @override
  PatientOnAppointmentModel? get patientOnAppointment {
    _$patientOnAppointmentAtom.reportRead();
    return super.patientOnAppointment;
  }

  @override
  set patientOnAppointment(PatientOnAppointmentModel? value) {
    _$patientOnAppointmentAtom.reportWrite(value, super.patientOnAppointment,
        () {
      super.patientOnAppointment = value;
    });
  }

  late final _$htmlEditorControllerAtom = Atom(
      name: '_PatientOnAppointmentStore.htmlEditorController',
      context: context);

  @override
  HtmlEditorController get htmlEditorController {
    _$htmlEditorControllerAtom.reportRead();
    return super.htmlEditorController;
  }

  @override
  set htmlEditorController(HtmlEditorController value) {
    _$htmlEditorControllerAtom.reportWrite(value, super.htmlEditorController,
        () {
      super.htmlEditorController = value;
    });
  }

  late final _$listHistoricAtom =
      Atom(name: '_PatientOnAppointmentStore.listHistoric', context: context);

  @override
  List<HistoricModel> get listHistoric {
    _$listHistoricAtom.reportRead();
    return super.listHistoric;
  }

  @override
  set listHistoric(List<HistoricModel> value) {
    _$listHistoricAtom.reportWrite(value, super.listHistoric, () {
      super.listHistoric = value;
    });
  }

  late final _$fetchPatientOnAppointmentAsyncAction = AsyncAction(
      '_PatientOnAppointmentStore.fetchPatientOnAppointment',
      context: context);

  @override
  Future<void> fetchPatientOnAppointment() {
    return _$fetchPatientOnAppointmentAsyncAction
        .run(() => super.fetchPatientOnAppointment());
  }

  late final _$fetchHistoricPatientAsyncAction = AsyncAction(
      '_PatientOnAppointmentStore.fetchHistoricPatient',
      context: context);

  @override
  Future<void> fetchHistoricPatient() {
    return _$fetchHistoricPatientAsyncAction
        .run(() => super.fetchHistoricPatient());
  }

  late final _$_PatientOnAppointmentStoreActionController =
      ActionController(name: '_PatientOnAppointmentStore', context: context);

  @override
  dynamic setAppointmentInitial(bool value) {
    final _$actionInfo = _$_PatientOnAppointmentStoreActionController
        .startAction(name: '_PatientOnAppointmentStore.setAppointmentInitial');
    try {
      return super.setAppointmentInitial(value);
    } finally {
      _$_PatientOnAppointmentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
appointmentInitial: ${appointmentInitial},
patientOnAppointment: ${patientOnAppointment},
htmlEditorController: ${htmlEditorController},
listHistoric: ${listHistoric}
    ''';
  }
}
