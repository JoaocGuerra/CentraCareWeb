import 'package:centralcareweb/medico/components/next_patient/next_patient_card.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../components/header_text.dart';
import '../../../constans/app_constants.dart';

class BuildNextPatients extends StatelessWidget {
  const BuildNextPatients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kSpacing),
            Row(
              children: const [
                Expanded(child: HeaderText("Próximos Pacientes")),
                Icon(
                  EvaIcons.calendarOutline,
                )
              ],
            ),
            const SizedBox(height: kSpacing,),
            const NextPatientCard(name: "João Guerra"),
            const NextPatientCard(name: "Marcelo Alves"),
            const NextPatientCard(name: "Pedro Henrique"),
            const NextPatientCard(name: "Maria Bonita"),
            const NextPatientCard(name: "Zefa da Galinha"),
            const NextPatientCard(name: "João Guerra"),
            const NextPatientCard(name: "Marcelo Alves"),
            const NextPatientCard(name: "Pedro Henrique"),
            const NextPatientCard(name: "Maria Bonita"),
            const NextPatientCard(name: "Zefa da Galinha"),
            const NextPatientCard(name: "João Guerra"),
            const NextPatientCard(name: "Marcelo Alves"),
            const NextPatientCard(name: "Pedro Henrique"),
            const NextPatientCard(name: "Maria Bonita"),
            const NextPatientCard(name: "Zefa da Galinha"),
            const NextPatientCard(name: "João Guerra"),
            const NextPatientCard(name: "Marcelo Alves"),
            const NextPatientCard(name: "Pedro Henrique"),
            const NextPatientCard(name: "Maria Bonita"),
            const NextPatientCard(name: "Zefa da Galinha"),
            const NextPatientCard(name: "João Guerra"),
            const NextPatientCard(name: "Marcelo Alves"),
            const NextPatientCard(name: "Pedro Henrique"),
            const NextPatientCard(name: "Maria Bonita"),
            const NextPatientCard(name: "Zefa da Galinha"),

          ],
        ),
      ),
    );
  }
}
