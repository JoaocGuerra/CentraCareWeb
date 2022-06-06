import 'package:flutter/material.dart';

class TexteConfirmNewAppointment extends StatelessWidget {
  const TexteConfirmNewAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Consulta agendada com sucesso.",
      style: TextStyle(
          fontSize: 17,
          color: Colors.green,
          fontWeight: FontWeight.bold),
    );;
  }
}
