import 'package:flutter/material.dart';

class PatientsLeft extends StatelessWidget {
  const PatientsLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text("Paciente a serem atendidos:"),
        SizedBox(
          width: 10,
        ),
        Text("10")
      ],
    );
  }
}
