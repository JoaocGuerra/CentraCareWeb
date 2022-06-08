import 'package:centralcareweb/repository/api/update_queue_repository.dart';
import 'package:centralcareweb/store/recepcionista_page/appointments_doctor/appointments_doctor_store.dart';
import 'package:centralcareweb/store/show_pages/show_home_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../model/date_details_model.dart';
import '../../../../repository/api/desmarcar_consulta_repository.dart';
import '../../../../repository/firebase_firestore/delete_date_doctor_repository.dart';

part 'details_date_doctor_store.g.dart';

class DetailsDateDoctorStore = _DetailsDateDoctorStore with _$DetailsDateDoctorStore;

abstract class _DetailsDateDoctorStore with Store {

  @observable
  bool loading = false;

  @observable
  DateDetailsModel? dateDetailsModel;

  double maxWidth = 400;

  String codigoMedico = "";
  String diaMesAno = "";

  final ShowHomeStore showHomeStore =  GetIt.I<ShowHomeStore>();


  @action
  Future<void> fetchDetailsDate() async {

    FirebaseFirestore.instance.collection('funcionarios').doc(codigoMedico).collection('atendimentos')
        .doc(diaMesAno).snapshots().listen((snapshotDate) async {

      loading = true;

      dateDetailsModel = DateDetailsModel(
          snapshotDate['inicio'], snapshotDate['fim'],
          snapshotDate['horarios_indisponiveis'], snapshotDate['intervalo'], snapshotDate['pacientes']);

      loading = false;

    });

  }

  @action
  Future<void> deselectDate() async {

    try{
      loading = true;
      await DeleteDateDoctorRepository().desmarcar();
      showHomeStore.setShowInHomeReceptionist(1);
      loading = false;
    }catch(e){
      loading = false;
      print(e);
    }

  }

}