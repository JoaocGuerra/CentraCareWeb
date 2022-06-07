import 'package:centralcareweb/components/responsive_builder.dart';
import 'package:centralcareweb/medico/components/on_appointment/end_appointment_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../components/header_text.dart';
import '../../../constans/app_constants.dart';
import 'status_patient_field.dart';

class BuildOnAppointmentCard extends StatelessWidget {

  BuildOnAppointmentCard({Key? key}) : super(key: key);

  HtmlEditorController controller = HtmlEditorController();

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
            SizedBox(
              height: _isMobile(context) ? kSpacing : 200,
            ),
            // Center(
            //   child: Container(
            //     height: 400,
            //     width: 600,
            //     decoration: BoxDecoration(
            //       color: Colors.blue.withOpacity(0.2),
            //       borderRadius: BorderRadius.circular(kSpacing),
            //     ),
            //     padding: const EdgeInsets.all(20),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children:[
            //         StatusPatientField(),
            //         Divider(),
            //         Text("Add receita"),
            //         Divider(),
            //         EndAppointmentButton()
            //       ],
            //     ),
            //   ),
            // )
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
