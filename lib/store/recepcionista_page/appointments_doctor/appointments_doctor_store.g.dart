// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_doctor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppointmentsDoctorStore on _AppointmentsDoctorStore, Store {
  late final _$loadingAtom =
      Atom(name: '_AppointmentsDoctorStore.loading', context: context);

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

  late final _$doctorNamesAtom =
      Atom(name: '_AppointmentsDoctorStore.doctorNames', context: context);

  @override
  List<String> get doctorNames {
    _$doctorNamesAtom.reportRead();
    return super.doctorNames;
  }

  @override
  set doctorNames(List<String> value) {
    _$doctorNamesAtom.reportWrite(value, super.doctorNames, () {
      super.doctorNames = value;
    });
  }

  late final _$dataAppointmentsAtom =
      Atom(name: '_AppointmentsDoctorStore.dataAppointments', context: context);

  @override
  Map<String, dynamic> get dataAppointments {
    _$dataAppointmentsAtom.reportRead();
    return super.dataAppointments;
  }

  @override
  set dataAppointments(Map<String, dynamic> value) {
    _$dataAppointmentsAtom.reportWrite(value, super.dataAppointments, () {
      super.dataAppointments = value;
    });
  }

  late final _$showDetailsAppointmentAtom = Atom(
      name: '_AppointmentsDoctorStore.showDetailsAppointment',
      context: context);

  @override
  bool get showDetailsAppointment {
    _$showDetailsAppointmentAtom.reportRead();
    return super.showDetailsAppointment;
  }

  @override
  set showDetailsAppointment(bool value) {
    _$showDetailsAppointmentAtom
        .reportWrite(value, super.showDetailsAppointment, () {
      super.showDetailsAppointment = value;
    });
  }

  late final _$fetchAppointmentsDoctorsAsyncAction = AsyncAction(
      '_AppointmentsDoctorStore.fetchAppointmentsDoctors',
      context: context);

  @override
  Future<void> fetchAppointmentsDoctors() {
    return _$fetchAppointmentsDoctorsAsyncAction
        .run(() => super.fetchAppointmentsDoctors());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
doctorNames: ${doctorNames},
dataAppointments: ${dataAppointments},
showDetailsAppointment: ${showDetailsAppointment}
    ''';
  }
}
