import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Cadastro de Funcionário",
      style: TextStyle(
          fontSize: 30,
          color: Colors.blueAccent.withOpacity(0.7),
          fontWeight: FontWeight.bold),
    );
  }
}
