import 'package:flutter/material.dart';

import '../../../constans/app_constants.dart';

class StatusPatientField extends StatelessWidget {
  const StatusPatientField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Como o paciente " "NOME DO PACIENTE " "está?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: kSpacing,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(kSpacing),
          ),
          padding: const EdgeInsets.all(kSpacing),
          height: 200,
          child: TextFormField(
            expands: true,
            maxLines: null,
          ),
        ),
      ],
    );
  }
}
