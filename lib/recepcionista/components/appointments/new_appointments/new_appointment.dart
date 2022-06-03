import 'package:centralcareweb/components/header_text.dart';
import 'package:centralcareweb/recepcionista/components/appointments/new_appointments/components/Buttons/button_register_appointment.dart';
import 'package:flutter/material.dart';

import '../../../../constans/app_constants.dart';

class NewAppointment extends StatelessWidget {
  const NewAppointment({Key? key, required this.step_two}) : super(key: key);

  final bool step_two;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: step_two,
      child: Column(
        children: const [
          SizedBox(
            height: 100,
          ),
          HeaderText("Especialidade"),
          SizedBox(
            height: kSpacing,
          ),
          Text("Aquela lógica que tu fez"),
          HeaderText("Médicos"),
          SizedBox(
            height: kSpacing,
          ),
          Text("Aquela lógica que tu fez"),
          HeaderText("Data"),
          SizedBox(
            height: kSpacing,
          ),
          Text("Aquela lógica que tu fez"),
          SizedBox(
            height: kSpacing,
          ),
          HeaderText("Horário"),
          SizedBox(
            height: kSpacing,
          ),
          Text("Aquela lógica que tu fez"),
          SizedBox(
            height: kSpacing,
          ),
          ButtonRegisterAppointment()
        ],
      ),
    );
  }
}
