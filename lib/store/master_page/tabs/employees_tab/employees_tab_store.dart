import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'employees_tab_store.g.dart';

class EmployeesTabStore = _EmployeesTabStore with _$EmployeesTabStore;

abstract class _EmployeesTabStore with Store {

  @observable
  bool loading = false;

  @observable
  List<dynamic> listEmployees = [];

  Future<void> fetchEmployees() async {

    try{
      FirebaseFirestore.instance.collection('funcionarios').snapshots().listen((snapshot) {
        loading = true;
        listEmployees = [];
        int lengthEmployees = snapshot.docs.length;
        for(int i=0; i<lengthEmployees; i++){
          if(snapshot.docs[i].get('funcao')!="admin"){
            listEmployees = List.from(listEmployees..add(snapshot.docs[i]));
          }
        }
        loading = false;
      });
    }catch(e){
      loading = false;
      print(e);
    }



  }


}