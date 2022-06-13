import 'package:centralcareweb/store/medico_page/next_patients/next_patients_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

class CreateQueueAttendanceRepository{

  final _db = FirebaseFirestore.instance;
  final NextPatientsStore nextPatientsStore =  GetIt.I<NextPatientsStore>();


  Future<void> createQueue(String doctor, String date)async {

    await _db.collection('fila')
        .doc(doctor+date)
        .set({'concluido':false,'paciente':0});

    nextPatientsStore.setAttendanceStart(true);

  }

}