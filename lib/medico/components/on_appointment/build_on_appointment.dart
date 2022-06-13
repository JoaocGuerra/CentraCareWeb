import 'package:centralcareweb/medico/components/on_appointment/body_build_on_appointment.dart';
import 'package:centralcareweb/medico/components/on_appointment/buttons/end_appointment_button.dart';
import 'package:centralcareweb/medico/components/on_appointment/texts/patient_felling.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../components/header_text.dart';
import '../../../constans/app_constants.dart';

class BuildOnAppointmentCard extends StatelessWidget {
  const BuildOnAppointmentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kSpacing),
            Row(
              children: const [
                Expanded(child: HeaderText("Em Atendimento")),
                Icon(
                  EvaIcons.calendarOutline,
                )
              ],
            ),
            const SizedBox(
              height: kSpacing ,
            ),
            BodyBuildOnAppointment()
          ],
        ),
      ),
    );
  }
}
