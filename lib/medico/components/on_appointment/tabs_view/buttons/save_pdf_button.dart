import 'package:centralcareweb/store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../store/medico_page/next_patients/next_patients_store.dart';


class SavePDFButton extends StatelessWidget {
  final PatientOnAppointmentStore patientOnAppointmentStore = GetIt.I<PatientOnAppointmentStore>();

  SavePDFButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12)),
        child: TextButton(
          onPressed: () async {
            var txt = await patientOnAppointmentStore.htmlEditorController.getText();
            if (txt.contains('src=\"data:')) {
              txt =
              '<text removed due to base-64 data, displaying the text could cause the app to crash>';
            }
            patientOnAppointmentStore.savePDF(txt);
          },
          child: const Center(
            child: Text(
              "Salvar PDF",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
