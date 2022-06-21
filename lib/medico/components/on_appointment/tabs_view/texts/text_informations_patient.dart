import 'package:centralcareweb/constans/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';


class TextInformationsPatient extends StatelessWidget {
  final PatientOnAppointmentStore patientOnAppointmentStore = GetIt.I<PatientOnAppointmentStore>();
  TextInformationsPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.blue[100],
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(patientOnAppointmentStore.patientOnAppointment?.foto ?? imageTransparent),
                )
            ),
          ),
          const SizedBox(height: kSpacing,),
          Wrap(
            children:[
              const Text(
                "Nome: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                patientOnAppointmentStore.patientOnAppointment?.nomeCompleto ?? "loading...",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: kSpacing,),

              const Text(
                "Sexo: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                patientOnAppointmentStore.patientOnAppointment?.sexo ?? "loading...",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: kSpacing,),

              const Text(
                "Idade: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                patientOnAppointmentStore.patientOnAppointment?.idade.toString() ?? "loading...",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
