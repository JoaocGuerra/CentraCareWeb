import 'package:flutter/material.dart';

class EmployeeText extends StatelessWidget {
  const EmployeeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Funcionários Cadastrados",
      style: TextStyle(
          fontSize: 30,
          color: Colors.blueAccent.withOpacity(0.7),
          fontWeight: FontWeight.bold),
    );
  }
}
