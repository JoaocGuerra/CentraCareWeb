import 'package:flutter/material.dart';

class TextPatientsSideBar extends StatelessWidget {
  const TextPatientsSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "Paciente",
        style: TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
