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
            Center(
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(kSpacing),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Resume(),
                        Divider(),
                        SizedBox(
                          height: kSpacing,
                        ),
                        PatientsLeft()
                      ],
                    ),
                    const StartAppointmentButton()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
