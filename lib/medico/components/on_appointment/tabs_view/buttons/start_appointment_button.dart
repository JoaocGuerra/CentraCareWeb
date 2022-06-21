import 'package:centralcareweb/store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../repository/firebase_firestore/update_status_repository.dart';

class StarAppointmentButton extends StatelessWidget {
  final PatientOnAppointmentStore patientOnAppointmentStore = GetIt.I<PatientOnAppointmentStore>();
  StarAppointmentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Container(
        width: 375,
        height: 30,
        decoration: BoxDecoration(
            color: patientOnAppointmentStore.appointmentInitial ? Colors.grey : Colors.green.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12)),
        child: TextButton(
          onPressed: patientOnAppointmentStore.appointmentInitial ?
          null
              :
              (){
            if(!patientOnAppointmentStore.appointmentInitial){
              UpdateStatusRepository().updateQueryInitial();
            }
          },
          child: const Center(
            child: Text(
              "Iniciar Consulta",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      );
    });
  }
}