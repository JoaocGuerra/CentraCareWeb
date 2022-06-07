import 'package:flutter/material.dart';

class TextConfirmPatient extends StatelessWidget {
  const TextConfirmPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Paciente cadastrado com sucesso.",
      style: TextStyle(
          fontSize: 17,
          color: Colors.green,
          fontWeight: FontWeight.bold),
    );;
  }
}
