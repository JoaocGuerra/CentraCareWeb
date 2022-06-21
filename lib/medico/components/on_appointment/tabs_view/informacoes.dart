import 'package:flutter/material.dart';

import 'buttons/historic/historic_patient_button.dart';
import 'buttons/start_appointment_button.dart';
import 'texts/text_informations_patient.dart';

class InformacoesHistorico extends StatelessWidget {
  const InformacoesHistorico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50,30,50,50),
      child: Column(
        children: [
          TextInformationsPatient(),
          const SizedBox(
            height: 10,
          ),
          StarAppointmentButton(),
          const SizedBox(
            height: 10,
          ),
          HistoricPatientButton()
        ],
      ),
    );
  }
}
