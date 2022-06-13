import 'package:centralcareweb/medico/components/next_patient/next_patient_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';


part 'patient_on_appointment_store.g.dart';

class PatientOnAppointmentStore = _PatientOnAppointmentStore with _$PatientOnAppointmentStore;

abstract class _PatientOnAppointmentStore with Store {

  final _db = FirebaseFirestore.instance;

  @observable
  bool loading = false;

  @observable
  List<dynamic> namePatients = [];

  @observable
  Map<String, dynamic> idPatients = <String, dynamic>{};

  @observable
  bool attendanceStart = false;
  @action
  setAttendanceStart(bool value){
    attendanceStart = value;
  }

  @action
  Future<void> fetchPatientsToday() async {


  }
}