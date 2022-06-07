import 'package:flutter/material.dart';

class TexteConfirmNewDate extends StatelessWidget {
  const TexteConfirmNewDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Data agendada com sucesso",
      style: TextStyle(
          fontSize: 17,
          color: Colors.green,
          fontWeight: FontWeight.bold),
    );;
  }
}
