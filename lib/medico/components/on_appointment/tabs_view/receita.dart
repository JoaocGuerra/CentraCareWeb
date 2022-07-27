import 'package:centralcareweb/medico/components/on_appointment/tabs_view/buttons/save_pdf_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constans/app_constants.dart';
import '../../../../store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';
import 'buttons/end_appointment_button.dart';
import 'editor/html_editor.dart';
class Receita extends StatelessWidget {
  final PatientOnAppointmentStore patientOnAppointmentStore = GetIt.I<PatientOnAppointmentStore>();
  Receita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return SingleChildScrollView(
        controller: ScrollController(initialScrollOffset: 0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(50,30,50,50),
          child: Column(
            children: [
              EditorText(),
              const Divider(),
              const SizedBox(
                height: kSpacing,
              ),
              patientOnAppointmentStore.loading ?
              const Center(
                child: CircularProgressIndicator(),
              )
                  :
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                      visible: patientOnAppointmentStore.receita!="",
                      child: TextButton(
                          onPressed: () => launch(patientOnAppointmentStore.receita),
                          child: Text("Link: "+patientOnAppointmentStore.receita)
                      )
                  ),
                  const SizedBox(height: 20,),
                  SavePDFButton()
                ],
              ),
              const SizedBox(height: 20,),
              Visibility(
                visible: patientOnAppointmentStore.receita!="",
                child: EndAppointmentButton()
              )
            ],
          ),
        ),
      );
    });
  }
}
