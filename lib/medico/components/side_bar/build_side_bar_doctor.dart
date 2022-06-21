import 'package:centralcareweb/constans/app_constants.dart';
import 'package:centralcareweb/medico/components/side_bar/buttons/go_appointment_button.dart';
import 'package:centralcareweb/medico/components/side_bar/buttons/home_button.dart';
import 'package:centralcareweb/recepcionista/components/side_bar/components/others/baseboard_side_bar.dart';
import 'package:centralcareweb/recepcionista/components/side_bar/components/others/header_side_bar.dart';
import 'package:centralcareweb/recepcionista/components/side_bar/components/text/text_doctor_side_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../recepcionista/components/side_bar/components/text/text_doctor_side_bar.dart';

class BuildSideBarDoctor extends StatelessWidget {
  const BuildSideBarDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderReceptionistSideBar(),
            const SizedBox(height: 20),
            const TextDoctorSideBar(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpacing),
              child: Column(
                children: [
                  HomeButton(),
                  const SizedBox(height: 20),
                  // GoAppointmentButton()
                ],
              ),
            )
          ],
        ),
        BaseboardSideBar()
      ],
    );
  }
}
