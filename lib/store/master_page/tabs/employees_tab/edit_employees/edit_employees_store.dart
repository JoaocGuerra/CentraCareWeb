import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../model/master/employee_model.dart';

part 'edit_employees_store.g.dart';

class EditEmployeesStore = _EditEmployeesStore with _$EditEmployeesStore;

abstract class _EditEmployeesStore with Store {

  double maxWidthBoxConstrains = 400;

  @observable
  bool loading = false;
  @observable
  bool employeeIsDoctor = false;
  @observable
  EmployeeModel? dataEmployee;

  String codigoFuncionario = "";

  TextEditingController cpfController = TextEditingController();
  TextEditingController nascimentoController = TextEditingController();
  TextEditingController especialidadeController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController sobrenomeController = TextEditingController();

  Future<void> fetchDataEmployee(String codigoFuncionario) async {

    this.codigoFuncionario = codigoFuncionario;

    try{
      FirebaseFirestore.instance.collection('funcionarios').doc(codigoFuncionario).snapshots().listen((snapshot) {
        loading = true;
        if(snapshot['funcao']=='medico'){
          employeeIsDoctor = true;
          dataEmployee =
              EmployeeModel(
                snapshot['cpf'],
                snapshot['data_nascimento'],
                snapshot['genero'],
                snapshot['nome'],
                snapshot['sobrenome'],
                snapshot['especialidade'],
              );
        }else if(snapshot['funcao']=='recepcionista'){
          employeeIsDoctor = false;
          dataEmployee =
              EmployeeModel(
                  snapshot['cpf'],
                  snapshot['data_nascimento'],
                  snapshot['genero'],
                  snapshot['nome'],
                  snapshot['sobrenome']
              );
        }
        loading = false;
      });
    }catch(e){
      loading = false;
      print(e);
    }

  }

  @action
  Future<void> updateEmployee() async {

    Map<String, dynamic> data = new Map<String, dynamic>();

    loading = true;

    if(cpfController.text.isNotEmpty) data['cpf'] = cpfController.text;
    if(nascimentoController.text.isNotEmpty) data['data_nascimento'] = nascimentoController.text;
    if(especialidadeController.text.isNotEmpty) data['especialidade'] = especialidadeController.text;
    if(nomeController.text.isNotEmpty) data['nome'] = nomeController.text;
    if(sobrenomeController.text.isNotEmpty) data['sobrenome'] = nomeController.text;


    if(data.isNotEmpty){
      await FirebaseFirestore.instance.collection('funcionarios').doc(codigoFuncionario).update(data);
    }

    loading = false;
    clearAllFields();
  }

  @action
  Future<void> deleteEmployee(String codigoFuncionario) async {

    loading = true;

    FirebaseFirestore.instance.collection('funcionarios').doc(codigoFuncionario).get().then((snapshot){
      if(snapshot['funcao']=="medico"){
        FirebaseFirestore.instance.collection('funcionarios').doc(codigoFuncionario).collection('atendimentos').get().then((snapshot) {
          for (DocumentSnapshot ds in snapshot.docs){
            ds.reference.delete();
          }
        });
        FirebaseFirestore.instance.collection('especialidades').doc(snapshot['especialidade']).get().then((snapshotSpecialty){
          List<dynamic> listaFuncionarios = snapshotSpecialty['lista_funcionarios'];
          listaFuncionarios.remove(codigoFuncionario);
          if(listaFuncionarios.isEmpty){
            snapshotSpecialty.reference.delete();
          }else{
            snapshotSpecialty.reference.update({'lista_funcionarios':listaFuncionarios});
          }

        });
      }

      FirebaseFirestore.instance.collection('funcionarios').doc(codigoFuncionario).delete();

    });

    loading = false;

  }

  @action
  void clearAllFields(){
    cpfController.text = "";
    nascimentoController.text = "";
    especialidadeController.text = "";
    nomeController.text = "";
    sobrenomeController.text = "";
  }


}