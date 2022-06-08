import 'package:flutter/material.dart';

class Resume extends StatelessWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Resumo do Dia",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
