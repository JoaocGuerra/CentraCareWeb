

import 'package:centralcareweb/repository/api/desmarcar_consulta_repository.dart';
import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/details_date_doctor/details_date_doctor_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

class DeleteDateDoctorRepository{

  final _db = FirebaseFirestore.instance;
  final DetailsDateDoctorStore detailsDateDoctorStore =  GetIt.I<DetailsDateDoctorStore>();

  Future<void> desmarcar()async {

    _db.collection('funcionarios')
        .doc(detailsDateDoctorStore.codigoMedico)
        .collection('atendimentos')
        .doc(detailsDateDoctorStore.diaMesAno).snapshots().listen((snapshot) { 
          
          List<dynamic> pacientes = snapshot['pacientes'];

          for(int i=0; i < pacientes.length; i++){
            DesmarcarConsultaRepository().desmarcar(
                detailsDateDoctorStore.codigoMedico,
                detailsDateDoctorStore.diaMesAno,
                pacientes[i].toString()
            );
          }
          
    });
    
    await _db.collection('funcionarios')
              .doc(detailsDateDoctorStore.codigoMedico)
              .collection('atendimentos')
              .doc(detailsDateDoctorStore.diaMesAno).delete();

  }

}