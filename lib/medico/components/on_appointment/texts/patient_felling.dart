import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';

class PatientFelling extends StatelessWidget {
  final PatientOnAppointmentStore patientOnAppointmentStore = GetIt.I<PatientOnAppointmentStore>();
  PatientFelling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Row(
        children:[
          const Text(
            "Como o paciente ",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            patientOnAppointmentStore.patientOnAppointment?.nomeCompleto ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Text(
            " está?",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      );
    });
  }
}
