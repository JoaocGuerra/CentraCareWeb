import 'package:flutter/material.dart';

class TextDoctorSideBar extends StatelessWidget {
  const TextDoctorSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "Médico",
        style: TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
