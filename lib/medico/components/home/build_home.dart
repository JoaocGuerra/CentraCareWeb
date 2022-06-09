import 'package:centralcareweb/medico/components/home/appointment_card.dart';
import 'package:centralcareweb/medico/components/home/texts/patients_left.dart';
import 'package:centralcareweb/medico/components/home/texts/resume.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../components/header_text.dart';
import '../../../constans/app_constants.dart';
import 'buttons/start_appointment_button.dart';

class BuildHome extends StatelessWidget {
  const BuildHome({Key? key}) : super(key: key);

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
                Expanded(child: HeaderText("Início")),
                Icon(
                  EvaIcons.homeOutline,
                )
              ],
            ),
            const SizedBox(
              height: kSpacing,
            ),
            SizedBox(
              height: 250,
              child: Scrollbar(
                child: ListView(
                  padding: EdgeInsets.all(20),
                  scrollDirection: Axis.horizontal,
                  children: [
                    AppointmentCard(
                      label: "09/06/2022",
                      details: "10 pacientes",
                    ),
                    const SizedBox(width: 10,),
                    AppointmentCard(
                      label: "10/06/2022",
                      details: "5 pacientes",
                    ),
                    const SizedBox(width: 10,),
                    AppointmentCard(
                      label: "11/06/2022",
                      details: "12 pacientes",
                    ),
                    const SizedBox(width: 10,),
                    AppointmentCard(
                      label: "12/06/2022",
                      details: "7 pacientes",
                    ),
                    const SizedBox(width: 10,),
                  ],
                ),
              ),
            )
            // Center(
            //   child: Container(
            //     height: 250,
            //     decoration: BoxDecoration(
            //       color: Colors.blue.withOpacity(0.2),
            //       borderRadius: BorderRadius.circular(kSpacing),
            //     ),
            //     padding: const EdgeInsets.all(20),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Column(
            //           children: const [
            //             Resume(),
            //             Divider(),
            //             SizedBox(
            //               height: kSpacing,
            //             ),
            //             PatientsLeft()
            //           ],
            //         ),
            //         const StartAppointmentButton()
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
