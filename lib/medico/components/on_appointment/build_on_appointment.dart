import 'package:centralcareweb/components/responsive_builder.dart';
import 'package:centralcareweb/medico/components/on_appointment/buttons/end_appointment_button.dart';
import 'package:centralcareweb/medico/components/on_appointment/texts/patient_felling.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../components/header_text.dart';
import '../../../constans/app_constants.dart';
import 'editor/html_editor.dart';

class BuildOnAppointmentCard extends StatelessWidget {
  BuildOnAppointmentCard({Key? key}) : super(key: key);

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
            const PatientFelling(),
            const SizedBox(
              height: kSpacing,
            ),
            Column(
              children: [
                EditorText(),
                const Divider(),
                const SizedBox(
                  height: kSpacing,
                ),
                const EndAppointmentButton()
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _isMobile(context) {
    if (ResponsiveBuilder.isMobile(context)) return true;
    return false;
  }
}
