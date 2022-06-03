import 'package:flutter/material.dart';

class TextFormDetails extends StatelessWidget {
  const TextFormDetails({Key? key}) : super(key: key);

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
