import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'details_appointments_doctor_store.g.dart';

class DetailsAppointmentsDoctorStore = _DetailsAppointmentsDoctorStore with _$DetailsAppointmentsDoctorStore;

abstract class _DetailsAppointmentsDoctorStore with Store {

  String codigoMedico = "";
  String codigoPaciente = "";
  String diaMesAno = "";


  @action
  Future<void> fetchDetailsAppointment() async {

    FirebaseFirestore.instance.collection('pacientes').doc(codigoPaciente).collection('consultas')
        .doc(codigoMedico+diaMesAno).snapshots().listen((snapshot) {

          print(snapshot.data());

    });

  }

}