import 'package:centralcareweb/recepcionista/components/register_patient/form_patient/form_patient.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../components/header_text.dart';
import '../../../constans/app_constants.dart';
import 'form_new_date/form_new_date.dart';

class NewDateDoctor extends StatelessWidget {
  const NewDateDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [
          const SizedBox(height: kSpacing),
          Row(
            children: const [
              Expanded(child: HeaderText("Novo Data Médico")),
              Icon(EvaIcons.calendar)
            ],
          ),
          FormNewDate()
        ],
      ),
    );
  }
}
