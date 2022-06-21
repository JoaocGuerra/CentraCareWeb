import 'package:centralcareweb/medico/components/next_patient/next_patient_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../repository/api/posicao_fila_repository.dart';
import '../../../repository/api/salvar_informacoes_consulta_repository.dart';
import '../../../utils/utils_datetime.dart';
import '../../api/posicao_fila_store.dart';
import '../../auth/auth_store.dart';

part 'next_patients_store.g.dart';

class NextPatientsStore = _NextPatientsStore with _$NextPatientsStore;

abstract class _NextPatientsStore with Store {

  final _db = FirebaseFirestore.instance;
  final AuthStore authStore =  GetIt.I<AuthStore>();
  final PosicaoFilaStore posicaoFilaStore = PosicaoFilaStore();
  final String diaMesAno = UtilsDateTime.getDatetimeNow();

  @observable
  bool loading = false;
  @observable
  bool loadingBuildNextPatients = false;

  @observable
  List<dynamic> namePatients = [];

  @observable
  Map<String, dynamic> idPatients = <String, dynamic>{};

  @observable
  int patientPosition = 0;

  @observable
  bool attendanceStart = false;
  @action
  setAttendanceStart(bool value){
    attendanceStart = value;
  }

  @observable
  bool attendanceFinish = false;

  @action
  Future<void> fetchPatientsToday() async {

    final String? codigoMedico = authStore.user?.uid;

    _db.collection('funcionarios')
        .doc(codigoMedico)
        .collection('atendimentos')
        .doc(diaMesAno)
        .snapshots().listen((snapshot) async {

          namePatients = List.from([]);
          idPatients = <String, dynamic>{};

          if(snapshot.exists){
            loadingBuildNextPatients = true;
            List<dynamic> patients = await snapshot['pacientes'];

            for(int i=0; i<patients.length; i++){
              await _db.collection('pacientes')
                  .doc(patients[i]).get()
                  .then((snapshotPatient) async {
                    await _db.collection('pacientes')
                        .doc(patients[i])
                        .collection('consultas')
                        .doc(codigoMedico!+diaMesAno).get()
                        .then((snapshotQuery) async {
                          String name = snapshotQuery['inicio']+" - "+snapshotPatient['nome'] + " " + snapshotPatient['sobrenome'];
                          if(!(namePatients.contains(name))){
                            idPatients[name] = {'id':patients[i],'inicio':snapshotQuery['inicio']};
                            namePatients = List.from(namePatients..add(name));
                          }
                    });
              });
            }
            namePatients.sort();
            loadingBuildNextPatients = false;
          }
    });

  }

  @action
  Future<void> fetchAttendanceStart()async {

    final String? codigoMedico = authStore.user?.uid;

    if(codigoMedico!=null){
      _db.collection('fila')
          .doc(codigoMedico+diaMesAno)
          .get().then((snapshot){

        if(snapshot.exists){
          setAttendanceStart(true);
        }

      });
    }

  }

  @action
  Future<void> fetchNextPatient(var txt)async {

    try{
      loading = true;
      await PosicaoFilaRepository().updatePatientAnswered(authStore.user?.uid ?? "", diaMesAno, patientPosition);
      await SalvarInformacoesConsultaRepository().save(authStore.user?.uid ?? "", diaMesAno, patientPosition,txt);
      loading = false;
    }catch(e){
      loading = false;
      print(e);
    }

  }

}