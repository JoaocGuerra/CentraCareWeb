import 'package:centralcareweb/medico/components/on_appointment/texts/patient_felling.dart';
import 'package:centralcareweb/medico/components/on_appointment/texts/text_informations_patient.dart';
import 'package:centralcareweb/store/medico_page/next_patients/next_patients_store.dart';
import 'package:centralcareweb/store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../constans/app_constants.dart';
import 'buttons/end_appointment_button.dart';
import 'buttons/historic_patient_button.dart';
import 'editor/html_editor.dart';

class BodyBuildOnAppointment extends StatelessWidget {
  final PatientOnAppointmentStore patientOnAppointmentStore = GetIt.I<PatientOnAppointmentStore>();
  final NextPatientsStore nextPatientsStore = GetIt.I<NextPatientsStore>();

  BodyBuildOnAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    patientOnAppointmentStore.fetchPatientOnAppointment();
    return Observer(builder: (_){
      return nextPatientsStore.loading?
      const Center(
        child: CircularProgressIndicator(),
      )
          :
      nextPatientsStore.attendanceFinish ?
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
      Column(
        children: [
          TextInformationsPatient(),
          const SizedBox(
            height: 10,
          ),
          HistoricPatientButton(),
          const SizedBox(
            height: 40,
          ),

          PatientFelling(),
          const SizedBox(
            height: kSpacing,
          ),

          EditorText(),
          const Divider(),
          const SizedBox(
            height: kSpacing,
          ),

          EndAppointmentButton()
        ],
      );
    });
  }
}
