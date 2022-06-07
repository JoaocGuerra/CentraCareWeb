import 'package:flutter/material.dart';

class ButtonRegisterAppointment extends StatelessWidget {
  const ButtonRegisterAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)),
          child: TextButton(
            onPressed: () {
              // change visibility
            },
            child: const Center(
              child: Text(
                "Agendar",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
        ));
  }
}
