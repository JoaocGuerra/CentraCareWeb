import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../repository/api/posicao_fila_repository.dart';

part 'posicao_fila_store.g.dart';

class PosicaoFilaStore = _PosicaoFilaStore with _$PosicaoFilaStore;

abstract class _PosicaoFilaStore with Store {

  final _db = FirebaseFirestore.instance;

  @observable
  bool loading = false;

  @observable
  String posicao = "";

  @observable
  String statusInAttendance = "";

  @action
  Future<void> fetchPositionQueue(String codigoMedico, String diaMesAno, String codigoPaciente) async {
    _db.collection('fila')
        .doc(codigoMedico+diaMesAno).snapshots().listen((snapshot) async {

          loading = true;
          posicao = await PosicaoFilaRepository().fetchPositionQueue(codigoMedico, diaMesAno, codigoPaciente);
          loading = false;

    });
  }

  @action
  Future<void> fetchPositionInAttendance(String codigoMedico, String diaMesAno) async {
    _db.collection('fila')
        .doc(codigoMedico+diaMesAno).snapshots().listen((snapshot) async {

      loading = true;
      statusInAttendance = await PosicaoFilaRepository().fetchPositionInAttendance(codigoMedico, diaMesAno);
      loading = false;

    });
  }

}