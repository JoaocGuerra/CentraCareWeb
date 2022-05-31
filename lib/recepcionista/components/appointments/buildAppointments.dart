import 'package:centralcareweb/recepcionista/components/appointments/components/date_card.dart';
import 'package:centralcareweb/recepcionista/components/appointments/components/doctor_card.dart';
import 'package:centralcareweb/recepcionista/components/appointments/components/patient_card.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../components/header_text.dart';
import '../../../constans/app_constants.dart';

class BuildAppointments extends StatelessWidget {

  BuildAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kSpacing),
            Row(
              children: const [
                Expanded(child: HeaderText("Consultas")),
                Icon(
                  EvaIcons.calendarOutline,
                )
              ],
            ),
            const SizedBox(height: kSpacing,),
            // TODO: ACREDITO QUE AQUI SERÁ UM STREAMBUILDER
            const DoctorCard(name: "Dr Marcelo"),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DateCard(date: "05/06/2022")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PatientCard(name: "João Abreu")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PatientCard(name: "João Abreu")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DateCard(date: "06/06/2022")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PatientCard(name: "João Abreu")
            ),

            const SizedBox(height: kSpacing,),

            // TODO: ACREDITO QUE AQUI SERÁ UM STREAMBUILDER
            const DoctorCard(name: "Dr Ronaldo"),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DateCard(date: "05/06/2022")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PatientCard(name: "João Abreu")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PatientCard(name: "João Abreu")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DateCard(date: "06/06/2022")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PatientCard(name: "João Abreu")
            ),
            const SizedBox(height: kSpacing,),
            // TODO: ACREDITO QUE AQUI SERÁ UM STREAMBUILDER
            const DoctorCard(name: "Dr Marcelo"),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DateCard(date: "05/06/2022")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PatientCard(name: "João Abreu")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PatientCard(name: "João Abreu")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DateCard(date: "06/06/2022")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PatientCard(name: "João Abreu")
            ),

            const SizedBox(height: kSpacing,),

            // TODO: ACREDITO QUE AQUI SERÁ UM STREAMBUILDER
            const DoctorCard(name: "Dr Ronaldo"),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DateCard(date: "05/06/2022")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PatientCard(name: "João Abreu")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PatientCard(name: "João Abreu")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DateCard(date: "06/06/2022")
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PatientCard(name: "João Abreu")
            ),
          ],
        ),
      ),
    );
  }
}
