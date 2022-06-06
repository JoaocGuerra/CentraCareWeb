import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'marcar_consulta_store.dart';

part 'users_store.g.dart';

class UsersStore = _UsersStore with _$UsersStore;

abstract class _UsersStore with Store {

  final _db = FirebaseFirestore.instance;
  final MarcarConsultaStore marcarConsultaStore = GetIt.I<MarcarConsultaStore>();

  @observable
  List<String> listUser = [];

  @observable
  Map<String, dynamic> dataUsers = <String, dynamic>{};

  @action
  Future<void> fetchUsers() async {
    
    _db.collection('pacientes').snapshots().listen((snapshot) {

      listUser = [];
      
      int lengthPatients = snapshot.docs.length;
      
      for(int i=0; i<lengthPatients; i++){

        String nameAndPhone = snapshot.docs[i].get("nome") + " " + snapshot.docs[i].get("sobrenome") + " - " +
            snapshot.docs[i].get("telefone");

        listUser = List.from(listUser..add(nameAndPhone));

        dataUsers[nameAndPhone] = snapshot.docs[i].get("id");

      }
      
    });


  }
}