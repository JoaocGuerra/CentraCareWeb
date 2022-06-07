import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../components/header_text.dart';
import '../../../../constans/app_constants.dart';
import '../new_appointments/new_appointment.dart';

class BuildNewAppointment extends StatelessWidget {
  const BuildNewAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [
          const SizedBox(height: kSpacing),
          Row(
            children: const [
              Expanded(child: HeaderText("Novo Agendamento")),
              Icon(EvaIcons.homeOutline)
            ],
          ),
          NewAppointment()
        ],
      ),
    );
  }
}
