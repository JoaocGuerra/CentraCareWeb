// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees_tab_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeesTabStore on _EmployeesTabStore, Store {
  late final _$loadingAtom =
      Atom(name: '_EmployeesTabStore.loading', context: context);

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

  late final _$loadingDataEmployeeAtom =
      Atom(name: '_EmployeesTabStore.loadingDataEmployee', context: context);

  @override
  bool get loadingDataEmployee {
    _$loadingDataEmployeeAtom.reportRead();
    return super.loadingDataEmployee;
  }

  @override
  set loadingDataEmployee(bool value) {
    _$loadingDataEmployeeAtom.reportWrite(value, super.loadingDataEmployee, () {
      super.loadingDataEmployee = value;
    });
  }

  late final _$listEmployeesAtom =
      Atom(name: '_EmployeesTabStore.listEmployees', context: context);

  @override
  List<dynamic> get listEmployees {
    _$listEmployeesAtom.reportRead();
    return super.listEmployees;
  }

  @override
  set listEmployees(List<dynamic> value) {
    _$listEmployeesAtom.reportWrite(value, super.listEmployees, () {
      super.listEmployees = value;
    });
  }

  @override
  String toString() {
    return '''
loading: ${loading},
loadingDataEmployee: ${loadingDataEmployee},
listEmployees: ${listEmployees}
    ''';
  }
}
