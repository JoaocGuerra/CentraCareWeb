// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_employees_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditEmployeesStore on _EditEmployeesStore, Store {
  late final _$loadingAtom =
      Atom(name: '_EditEmployeesStore.loading', context: context);

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

  late final _$employeeIsDoctorAtom =
      Atom(name: '_EditEmployeesStore.employeeIsDoctor', context: context);

  @override
  bool get employeeIsDoctor {
    _$employeeIsDoctorAtom.reportRead();
    return super.employeeIsDoctor;
  }

  @override
  set employeeIsDoctor(bool value) {
    _$employeeIsDoctorAtom.reportWrite(value, super.employeeIsDoctor, () {
      super.employeeIsDoctor = value;
    });
  }

  late final _$dataEmployeeAtom =
      Atom(name: '_EditEmployeesStore.dataEmployee', context: context);

  @override
  EmployeeModel? get dataEmployee {
    _$dataEmployeeAtom.reportRead();
    return super.dataEmployee;
  }

  @override
  set dataEmployee(EmployeeModel? value) {
    _$dataEmployeeAtom.reportWrite(value, super.dataEmployee, () {
      super.dataEmployee = value;
    });
  }

  late final _$updateEmployeeAsyncAction =
      AsyncAction('_EditEmployeesStore.updateEmployee', context: context);

  @override
  Future<void> updateEmployee() {
    return _$updateEmployeeAsyncAction.run(() => super.updateEmployee());
  }

  late final _$deleteEmployeeAsyncAction =
      AsyncAction('_EditEmployeesStore.deleteEmployee', context: context);

  @override
  Future<void> deleteEmployee(String codigoFuncionario) {
    return _$deleteEmployeeAsyncAction
        .run(() => super.deleteEmployee(codigoFuncionario));
  }

  late final _$_EditEmployeesStoreActionController =
      ActionController(name: '_EditEmployeesStore', context: context);

  @override
  void clearAllFields() {
    final _$actionInfo = _$_EditEmployeesStoreActionController.startAction(
        name: '_EditEmployeesStore.clearAllFields');
    try {
      return super.clearAllFields();
    } finally {
      _$_EditEmployeesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
employeeIsDoctor: ${employeeIsDoctor},
dataEmployee: ${dataEmployee}
    ''';
  }
}
