import 'package:centralcareweb/utils/utils_datetime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../auth/auth_store.dart';

part 'query_doctor_store.g.dart';

class QueryDoctorStore = _QueryDoctorStore with _$QueryDoctorStore;

abstract class _QueryDoctorStore with Store {

  final _db = FirebaseFirestore.instance;
  final AuthStore authStore =  GetIt.I<AuthStore>();

  @observable
  bool loading = false;

  @observable
  List<dynamic> namesQuerys = [];

  @observable
  Map<String, dynamic> querys = <String, dynamic>{};

  @action
  Future<void> fetchQueryDoctor() async {

    _db.collection('funcionarios')
        .doc(authStore.user?.uid)
        .collection('atendimentos')
        .snapshots().listen((snapshot) async {

      namesQuerys = [];
      querys = <String, dynamic>{};

      if(snapshot.docs.isNotEmpty){
        loading = true;
        for(int i=0; i<snapshot.docs.length; i++){
          String nameQuery = UtilsDateTime.convertFormatDate(snapshot.docs[i].id);

          if(snapshot.docs[i]['disponivel']){
            namesQuerys.add(nameQuery);
            querys[nameQuery] = {
              'dia_mes_ano': snapshot.docs[i].id,
              'pacientes':snapshot.docs[i]['pacientes'].length
            };
          }

        }
        loading = false;
      }

    });
  }

}