import 'package:flutter/material.dart';

class TextConfirmRegisterTab extends StatelessWidget {
  const TextConfirmRegisterTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Usuário cadastrado com sucesso.",
      style: TextStyle(
          fontSize: 17,
          color: Colors.green,
          fontWeight: FontWeight.bold),
    );
  }
}
