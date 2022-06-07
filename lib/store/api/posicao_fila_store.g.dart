// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posicao_fila_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PosicaoFilaStore on _PosicaoFilaStore, Store {
  late final _$loadingAtom =
      Atom(name: '_PosicaoFilaStore.loading', context: context);

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

  late final _$posicaoAtom =
      Atom(name: '_PosicaoFilaStore.posicao', context: context);

  @override
  String get posicao {
    _$posicaoAtom.reportRead();
    return super.posicao;
  }

  @override
  set posicao(String value) {
    _$posicaoAtom.reportWrite(value, super.posicao, () {
      super.posicao = value;
    });
  }

  late final _$statusInAttendanceAtom =
      Atom(name: '_PosicaoFilaStore.statusInAttendance', context: context);

  @override
  String get statusInAttendance {
    _$statusInAttendanceAtom.reportRead();
    return super.statusInAttendance;
  }

  @override
  set statusInAttendance(String value) {
    _$statusInAttendanceAtom.reportWrite(value, super.statusInAttendance, () {
      super.statusInAttendance = value;
    });
  }

  late final _$fetchPositionQueueAsyncAction =
      AsyncAction('_PosicaoFilaStore.fetchPositionQueue', context: context);

  @override
  Future<void> fetchPositionQueue(
      String codigoMedico, String diaMesAno, String codigoPaciente) {
    return _$fetchPositionQueueAsyncAction.run(() =>
        super.fetchPositionQueue(codigoMedico, diaMesAno, codigoPaciente));
  }

  late final _$fetchPositionInAttendanceAsyncAction = AsyncAction(
      '_PosicaoFilaStore.fetchPositionInAttendance',
      context: context);

  @override
  Future<void> fetchPositionInAttendance(
      String codigoMedico, String diaMesAno) {
    return _$fetchPositionInAttendanceAsyncAction
        .run(() => super.fetchPositionInAttendance(codigoMedico, diaMesAno));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
posicao: ${posicao},
statusInAttendance: ${statusInAttendance}
    ''';
  }
}
