import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'doctor_store.g.dart';

class DoctorsStoreNewDate = _DoctorsStoreNewDate with _$DoctorsStoreNewDate;

abstract class _DoctorsStoreNewDate with Store {

  final _db = FirebaseFirestore.instance;

  @observable
  bool loading = true;

  @observable
  List<String> doctorNames = [];

  @observable
  Map<String, dynamic> idDoctors = <String, dynamic>{};

  @action
  Future<void> fetchDoctors() async {

    try{

      await _db.collection('funcionarios').snapshots().listen((snapshot) {
        loading = true;

        doctorNames = [];
        idDoctors = <String, dynamic>{};

        int lengthDoctors = snapshot.docs.length;

        for(int i=0;i<lengthDoctors;i++){
          if(snapshot.docs[i]['funcao']=="medico"){
            String name = snapshot.docs[i]['nome'] + " " +snapshot.docs[i]['sobrenome'] + " - " +
                          snapshot.docs[i]['especialidade'];
            doctorNames = List.from(doctorNames..add(name));
            idDoctors[name] = snapshot.docs[i].id;
          }
        }

        loading = false;

      });

    }catch (e){
      loading = false;
      print(e);
    }
  }
}