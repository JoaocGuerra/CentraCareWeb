import 'package:centralcareweb/medico/components/next_patient/next_patient_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../utils/utils_datetime.dart';
import '../../auth/auth_store.dart';

part 'next_patients_store.g.dart';

class NextPatientsStore = _NextPatientsStore with _$NextPatientsStore;

abstract class _NextPatientsStore with Store {

  final _db = FirebaseFirestore.instance;
  final AuthStore authStore =  GetIt.I<AuthStore>();

  @observable
  bool loading = false;

  @observable
  List<dynamic> pacientes = [];

  @action
  Future<void> fetchPatientsToday() async {

    _db.collection('funcionarios')
        .doc(authStore.user?.uid)
        .collection('atendimentos')
        .doc(UtilsDateTime.getDatetimeNow())
        .snapshots().listen((snapshot) async {

          loading = true;
          pacientes = await snapshot['pacientes'];
          loading = false;

    });
  }

}