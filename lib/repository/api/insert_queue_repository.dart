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
  final _user = FirebaseAuth.instance.currentUser;
  final MarcarConsultaStore marcarConsultaStore = GetIt.I<MarcarConsultaStore>();
  final UsersStore usersStore = GetIt.I<UsersStore>();

  Future<void> insertQueue() async{
      Map<String, dynamic> mapInsert = new Map<String, dynamic>();

      String id = usersStore.idUsers[marcarConsultaStore.userController.text];

      mapInsert["codigo_medico"] = marcarConsultaStore.selectedDoctor;
      mapInsert["nome_medico"] = marcarConsultaStore.nameDoctor;
      mapInsert["especialidade_medico"] = marcarConsultaStore.specialtyDoctor;
      mapInsert["dia_mes_ano"] = marcarConsultaStore.selectedDate;
      mapInsert["codigo_paciente"] = id;
      mapInsert["inicio"] = marcarConsultaStore.selectedHour;
      mapInsert["status"] = "marcada";
      mapInsert["termino"] = "-";
      mapInsert["receita"] = "";

      print(mapInsert);

      await _db.collection('pacientes')
          .doc(id)
          .collection('consultas').doc(marcarConsultaStore.selectedDoctor+marcarConsultaStore.selectedDate).set(mapInsert);

      mapInsert = new Map<String, dynamic>();
      List<String> hoursSplit = marcarConsultaStore.selectedHour.split(":");

      mapInsert["codigo_medico"] = marcarConsultaStore.selectedDoctor;
      mapInsert["dia_mes_ano"] = marcarConsultaStore.selectedDate;
      mapInsert["codigo_paciente"] = id;
      mapInsert["hora"] = int.parse(hoursSplit[0]);
      mapInsert["minuto"] = int.parse(hoursSplit[1]);

      try{
        await _dio.post(pathLocal + pathInsertQueue, data: mapInsert);
      }catch(e){
        print(e);
      }

      marcarConsultaStore.clearAllFields();

  }

}