import 'package:centralcareweb/medico/components/on_appointment/texts/patient_felling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../constans/app_constants.dart';
import 'buttons/end_appointment_button.dart';
import 'editor/html_editor.dart';

class BodyBuildOnAppointment extends StatelessWidget {
  const BodyBuildOnAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Column(
        children: [
          const PatientFelling(),
          const SizedBox(
            height: kSpacing,
          ),

          EditorText(),
          const Divider(),
          const SizedBox(
            height: kSpacing,
          ),

          const EndAppointmentButton()
        ],
      );
    });
  }
}
