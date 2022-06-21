import 'package:flutter/material.dart';

import '../../../../constans/app_constants.dart';
import 'buttons/end_appointment_button.dart';
import 'editor/html_editor.dart';
class Receita extends StatelessWidget {
  const Receita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50,30,50,50),
      child: Column(
        children: [
          EditorText(),
          const Divider(),
          const SizedBox(
            height: kSpacing,
          ),

          EndAppointmentButton()
        ],
      ),
    );
  }
}
