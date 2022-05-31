import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            const Icon(Icons.cancel_outlined, color: Colors.red,)
          ],
        ),
      ],
    );
  }
}
