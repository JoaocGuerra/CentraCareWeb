import 'package:centralcareweb/medico/components/on_appointment/tabs_view/anamnese.dart';
import 'package:centralcareweb/medico/components/on_appointment/tabs_view/exame_fisico.dart';
import 'package:centralcareweb/medico/components/on_appointment/tabs_view/informacoes.dart';
import 'package:centralcareweb/medico/components/on_appointment/tabs_view/receita.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../components/header_text.dart';
import '../../../constans/app_constants.dart';
import '../../../store/medico_page/next_patients/next_patients_store.dart';
import '../../../store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';

class BuildOnAppointmentCard extends StatelessWidget {
  final PatientOnAppointmentStore patientOnAppointmentStore = GetIt.I<PatientOnAppointmentStore>();
  final NextPatientsStore nextPatientsStore = GetIt.I<NextPatientsStore>();
  BuildOnAppointmentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    patientOnAppointmentStore.fetchPatientOnAppointment();
    return Observer(builder: (_){
      return nextPatientsStore.loading?
        const Center(
          child: CircularProgressIndicator(),
        )
          :
        DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text("Em Atendimento",style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottom: const TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(child: Text("Informações e Histórico",style: TextStyle(color: Colors.black),),),
                Tab(child: Text("Anamnese",style: TextStyle(color: Colors.black),),),
                Tab(child: Text("Exame Físico",style: TextStyle(color: Colors.black),),),
                Tab(child: Text("Receita",style: TextStyle(color: Colors.black),),)
              ],
            ),
          ),
          body: nextPatientsStore.attendanceFinish ?
          Center(
            child: Column(
              children: const [
                Icon(Icons.check,size: 40,color: Colors.green,),
                SizedBox(height: kSpacing,),
                Text("Atendimentos finalizados.")
              ],
            ),
          )
              :
          TabBarView(
            children: [
              const InformacoesHistorico(),
              Anamnese(),
              ExameFisico(),
              const Receita(),
            ],
          ),
        ),
      );
    });
  }
}
