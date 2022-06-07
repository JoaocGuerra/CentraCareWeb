// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_date_doctor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewDateDoctorStore on _NewDateDoctorStore, Store {
  Computed<bool>? _$isFilledComputed;

  @override
  bool get isFilled =>
      (_$isFilledComputed ??= Computed<bool>(() => super.isFilled,
              name: '_NewDateDoctorStore.isFilled'))
          .value;

  late final _$dataAtendimentoAtom =
      Atom(name: '_NewDateDoctorStore.dataAtendimento', context: context);

  @override
  String get dataAtendimento {
    _$dataAtendimentoAtom.reportRead();
    return super.dataAtendimento;
  }

  @override
  set dataAtendimento(String value) {
    _$dataAtendimentoAtom.reportWrite(value, super.dataAtendimento, () {
      super.dataAtendimento = value;
    });
  }

  late final _$inicioAtendimentoAtom =
      Atom(name: '_NewDateDoctorStore.inicioAtendimento', context: context);

  @override
  String get inicioAtendimento {
    _$inicioAtendimentoAtom.reportRead();
    return super.inicioAtendimento;
  }

  @override
  set inicioAtendimento(String value) {
    _$inicioAtendimentoAtom.reportWrite(value, super.inicioAtendimento, () {
      super.inicioAtendimento = value;
    });
  }

  late final _$finalAtendimentoAtom =
      Atom(name: '_NewDateDoctorStore.finalAtendimento', context: context);

  @override
  String get finalAtendimento {
    _$finalAtendimentoAtom.reportRead();
    return super.finalAtendimento;
  }

  @override
  set finalAtendimento(String value) {
    _$finalAtendimentoAtom.reportWrite(value, super.finalAtendimento, () {
      super.finalAtendimento = value;
    });
  }

  late final _$horasIndisponiveisAtom =
      Atom(name: '_NewDateDoctorStore.horasIndisponiveis', context: context);

  @override
  List<String> get horasIndisponiveis {
    _$horasIndisponiveisAtom.reportRead();
    return super.horasIndisponiveis;
  }

  @override
  set horasIndisponiveis(List<String> value) {
    _$horasIndisponiveisAtom.reportWrite(value, super.horasIndisponiveis, () {
      super.horasIndisponiveis = value;
    });
  }

  late final _$horaSelecionadaAtom =
      Atom(name: '_NewDateDoctorStore.horaSelecionada', context: context);

  @override
  String get horaSelecionada {
    _$horaSelecionadaAtom.reportRead();
    return super.horaSelecionada;
  }

  @override
  set horaSelecionada(String value) {
    _$horaSelecionadaAtom.reportWrite(value, super.horaSelecionada, () {
      super.horaSelecionada = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_NewDateDoctorStore.loading', context: context);

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

  late final _$dateRegisterAtom =
      Atom(name: '_NewDateDoctorStore.dateRegister', context: context);

  @override
  bool get dateRegister {
    _$dateRegisterAtom.reportRead();
    return super.dateRegister;
  }

  @override
  set dateRegister(bool value) {
    _$dateRegisterAtom.reportWrite(value, super.dateRegister, () {
      super.dateRegister = value;
    });
  }

  late final _$insertNewDateAsyncAction =
      AsyncAction('_NewDateDoctorStore.insertNewDate', context: context);

  @override
  Future<void> insertNewDate() {
    return _$insertNewDateAsyncAction.run(() => super.insertNewDate());
  }

  late final _$_NewDateDoctorStoreActionController =
      ActionController(name: '_NewDateDoctorStore', context: context);

  @override
  void setInicioAtendimento(String time) {
    final _$actionInfo = _$_NewDateDoctorStoreActionController.startAction(
        name: '_NewDateDoctorStore.setInicioAtendimento');
    try {
      return super.setInicioAtendimento(time);
    } finally {
      _$_NewDateDoctorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFinalAtendimento(String time) {
    final _$actionInfo = _$_NewDateDoctorStoreActionController.startAction(
        name: '_NewDateDoctorStore.setFinalAtendimento');
    try {
      return super.setFinalAtendimento(time);
    } finally {
      _$_NewDateDoctorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHorasIndisponiveis(String horario) {
    final _$actionInfo = _$_NewDateDoctorStoreActionController.startAction(
        name: '_NewDateDoctorStore.setHorasIndisponiveis');
    try {
      return super.setHorasIndisponiveis(horario);
    } finally {
      _$_NewDateDoctorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAllFields() {
    final _$actionInfo = _$_NewDateDoctorStoreActionController.startAction(
        name: '_NewDateDoctorStore.clearAllFields');
    try {
      return super.clearAllFields();
    } finally {
      _$_NewDateDoctorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataAtendimento: ${dataAtendimento},
inicioAtendimento: ${inicioAtendimento},
finalAtendimento: ${finalAtendimento},
horasIndisponiveis: ${horasIndisponiveis},
horaSelecionada: ${horaSelecionada},
loading: ${loading},
dateRegister: ${dateRegister},
isFilled: ${isFilled}
    ''';
  }
}
