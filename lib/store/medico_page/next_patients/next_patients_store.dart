import 'package:centralcareweb/medico/components/next_patient/next_patient_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../repository/api/posicao_fila_repository.dart';
import '../../../utils/utils_datetime.dart';
import '../../api/posicao_fila_store.dart';
import '../../auth/auth_store.dart';

part 'next_patients_store.g.dart';

class NextPatientsStore = _NextPatientsStore with _$NextPatientsStore;

abstract class _NextPatientsStore with Store {

  final _db = FirebaseFirestore.instance;
  final AuthStore authStore =  GetIt.I<AuthStore>();
  final PosicaoFilaStore posicaoFilaStore = PosicaoFilaStore();

  @observable
  bool loading = false;

  @observable
  List<dynamic> namePatients = [];

  Map<String, dynamic> idPatients = <String, dynamic>{};

  @action
  Future<void> fetchPatientsToday() async {

    String diaMesAno = UtilsDateTime.getDatetimeNow();

    _db.collection('funcionarios')
        .doc(authStore.user?.uid)
        .collection('atendimentos')
        .doc(diaMesAno)
        .snapshots().listen((snapshot) async {

          namePatients = List.from([]);
          print("Aqui tbm");
          idPatients = <String, dynamic>{};

          if(snapshot.exists){
            loading = true;
            List<dynamic> patients = await snapshot['pacientes'];

            // for(int i=0; i<patients.length; i++){
            //   // print(await _db.collection('pacientes')
            //   //     .doc(patients[i]));
            //   await _db.collection('pacientes')
            //       .doc(patients[i]).get()
            //       .then((snapshotPatient) async{
            //         String name = snapshotPatient['nome'] + " " + snapshotPatient['sobrenome'];
            //         // String posicao = await PosicaoFilaRepository()
            //         //     .fetchPositionQueue(authStore.user?.uid ?? "" , diaMesAno, patients[i]);
            //         // print(posicao);
            //         idPatients[name] = patients[i];
            //         namePatients = List.from(namePatients..add(name));
            //         print("AQUI");
            //   });
            // }
            loading = false;
          }

    });
  }

}