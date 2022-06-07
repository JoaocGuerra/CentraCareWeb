import 'package:flutter/material.dart';

class TextFormDetailsDate extends StatelessWidget {
  const TextFormDetailsDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Detalhes da Consulta",
      style: TextStyle(
          fontSize: 30,
          color: Colors.blueAccent.withOpacity(0.7),
          fontWeight: FontWeight.bold),
    );
  }
}
