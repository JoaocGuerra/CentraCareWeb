import 'package:centralcareweb/recepcionista/components/appointments/new_appointments/new_appointment.dart';
import 'package:centralcareweb/recepcionista/components/appointments/new_appointments/register_patient.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../components/header_text.dart';
import '../../../../constans/app_constants.dart';

class BuildNewAppointment extends StatelessWidget {
  BuildNewAppointment({Key? key}) : super(key: key);

  bool step_one = true;
  bool step_two = false;

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
          //TODO nese primeiro passo, inverter os valores dos parâmetros
          RegisterPatient(step_one: step_one),
          NewAppointment(step_two: step_two)
        ],
      ),
    );
  }
}
