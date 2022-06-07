import 'package:flutter/material.dart';

class EndAppointmentButton extends StatelessWidget {
  const EndAppointmentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12)),
        child: TextButton(
          onPressed: () {},
          child: const Center(
            child: Text(
              "Encerrar Atendimento",
              style: TextStyle(color: Colors.black, fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
