import 'package:centralcareweb/store/recepcionista_page/new_appointment/users_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../constans/app_constants.dart';
import '../../store/recepcionista_page/new_appointment/marcar_consulta_store.dart';


class InsertQueueRepository{

  final _dio = Dio();
  final _db = FirebaseFirestore.instance;
  final MarcarConsultaStore marcarConsultaStore = GetIt.I<MarcarConsultaStore>();
  final UsersStore usersStore = GetIt.I<UsersStore>();

  Future<void> insertQueue() async{

    String id = usersStore.idUsers[marcarConsultaStore.userController.text];
    List<dynamic> pacientes = [];
    Map<String, dynamic> mapUpdate = Map<String, dynamic>();

    _db.collection('funcionarios')
        .doc(marcarConsultaStore.selectedDoctor)
        .collection('atendimentos')
        .doc(marcarConsultaStore.selectedDate)
        .get().then((snapshot) async {

      pacientes = await snapshot['pacientes'];

      if(!pacientes.contains(id)) {
        pacientes.add(id);
      }

      mapUpdate['pacientes'] = pacientes;

      snapshot.reference.update(mapUpdate);

    });

      Map<String, dynamic> mapInsert = new Map<String, dynamic>();

      mapInsert["codigo_medico"] = marcarConsultaStore.selectedDoctor;
      mapInsert["nome_medico"] = marcarConsultaStore.nameDoctor;
      mapInsert["especialidade_medico"] = marcarConsultaStore.specialtyDoctor;
      mapInsert["dia_mes_ano"] = marcarConsultaStore.selectedDate;
      mapInsert["codigo_paciente"] = id;
      mapInsert["inicio"] = marcarConsultaStore.selectedHour;
      mapInsert["status"] = "marcada";
      mapInsert["termino"] = "-";
      mapInsert["receita"] = "";
      mapInsert["queixa_principal"] = "";
      mapInsert["historia_da_doenca_atual"] = "";
      mapInsert["revisao_de_sistemas"] = "";
      mapInsert["historia_medica_pregressa"] = "";
      mapInsert["historia_familiar"] = "";
      mapInsert["perfil_psicossocial"] = "";
      mapInsert["sinais_vitais"] = "";
      mapInsert["avaliacoes"] = "";

      await _db.collection('pacientes')
          .doc(id)
          .collection('consultas').doc(marcarConsultaStore.selectedDoctor+marcarConsultaStore.selectedDate).set(mapInsert);

      Map<String, dynamic> mapInsertQueue = new Map<String, dynamic>();
      List<String> hoursSplit = marcarConsultaStore.selectedHour.split(":");

      mapInsertQueue["codigo_medico"] = marcarConsultaStore.selectedDoctor;
      mapInsertQueue["dia_mes_ano"] = marcarConsultaStore.selectedDate;
      mapInsertQueue["codigo_paciente"] = id;
      mapInsertQueue["hora"] = int.parse(hoursSplit[0]);
      mapInsertQueue["minuto"] = int.parse(hoursSplit[1]);

      try{
        await _dio.post(pathLocal + pathInsertQueue, data: mapInsertQueue);
      }catch(e){
        print(e);
      }

      marcarConsultaStore.clearAllFields();

  }

}