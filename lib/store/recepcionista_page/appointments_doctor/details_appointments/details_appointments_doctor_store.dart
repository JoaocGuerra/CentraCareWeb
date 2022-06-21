import 'package:centralcareweb/repository/api/update_queue_repository.dart';
import 'package:centralcareweb/store/recepcionista_page/appointments_doctor/appointments_doctor_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../model/appointment_model.dart';
import '../../../../repository/api/desmarcar_consulta_repository.dart';
import '../../../show_pages/show_store.dart';

part 'details_appointments_doctor_store.g.dart';

class DetailsAppointmentsDoctorStore = _DetailsAppointmentsDoctorStore with _$DetailsAppointmentsDoctorStore;

abstract class _DetailsAppointmentsDoctorStore with Store {

  @observable
  bool loading = false;
  @observable
  bool changeHours = false;

  @observable
  TextEditingController inicioController = TextEditingController();
  @observable
  TextEditingController terminoController = TextEditingController();
  @observable
  TextEditingController receitaController = TextEditingController();
  @observable
  TextEditingController statusController = TextEditingController();

  @observable
  AppointmentModel? appointmentModel;

  @observable
  String newHourIni = "";

  double maxWidthBoxConstrains = 400;

  String codigoPaciente = "";
  String codigoMedico = "";
  String diaMesAno = "";

  final ShowStore showHomeStore =  GetIt.I<ShowStore>();

  @action
  void setSelectedHour(String hour){
    newHourIni = hour;
  }

  @action
  void setChangeHours(bool value){
    changeHours = value;
  }

  @action
  Future<void> fetchDetailsAppointment() async {

    FirebaseFirestore.instance.collection('pacientes').doc(codigoPaciente).collection('consultas')
        .doc(codigoMedico+diaMesAno).snapshots().listen((snapshotAppointment) async {

          loading = true;

          FirebaseFirestore.instance.collection('pacientes').doc(codigoPaciente).snapshots().listen((snapshotUser) async {
            appointmentModel = await AppointmentModel(
                snapshotUser.get("nome") + " " + snapshotUser.get("sobrenome"),
                codigoMedico, codigoPaciente, diaMesAno,
                snapshotAppointment.get("nome_medico"), snapshotAppointment.get("especialidade_medico"),
                snapshotAppointment.get("inicio"), snapshotAppointment.get("termino"), snapshotAppointment.get("status"), snapshotAppointment.get("receita"));
          });

          loading = false;

    });

  }

  @action
  Future<void> updateAppointment() async {

    Map<String, dynamic> data = new Map<String, dynamic>();

    loading = true;

    if(inicioController.text.isNotEmpty) data['inicio'] = inicioController.text;
    if(terminoController.text.isNotEmpty) data['termino'] = terminoController.text;
    if(receitaController.text.isNotEmpty) data['receita'] = receitaController.text;
    if(statusController.text.isNotEmpty) data['status'] = statusController.text;
    if(newHourIni.isNotEmpty) {
      data['inicio'] = newHourIni;
      await UpdateQueueRepository().updateQueue();
    }

      if(data.isNotEmpty){
        await FirebaseFirestore.instance.collection('pacientes').doc(appointmentModel?.codigoPaciente).collection('consultas')
            .doc((appointmentModel?.codigoMedico ?? "")+(appointmentModel?.diaMesAno ?? "")).update(data);
      }

      loading = false;
      clearAllFields();
  }

  @action
  Future<void> deselectQuery() async {

    try{
      loading = true;
      await DesmarcarConsultaRepository().desmarcar(codigoMedico, diaMesAno, codigoPaciente);
      showHomeStore.setShowInHomeReceptionist(1);
      loading = false;
    }catch(e){
      loading = false;
      print(e);
    }

  }

  @action
  void clearAllFields(){
    inicioController.text = "";
    terminoController.text = "";
    receitaController.text = "";
    statusController.text = "";
    changeHours = false;
  }

}