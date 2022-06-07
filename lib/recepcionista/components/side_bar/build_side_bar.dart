import 'package:centralcareweb/recepcionista/components/side_bar/components/button/button_new_date_doctor_side_bar.dart';
import 'package:centralcareweb/recepcionista/components/side_bar/components/others/baseboard_side_bar.dart';
import 'package:centralcareweb/recepcionista/components/side_bar/components/others/header_side_bar.dart';
import 'package:centralcareweb/recepcionista/components/side_bar/components/text/text_patient_side_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constans/app_constants.dart';
import 'components/button/button_new_appointment_side_bar.dart';
import 'components/button/button_register_patient_side_bar.dart';
import 'components/text/text_doctor_side_bar.dart';

class BuildSideBar extends StatelessWidget {

  const BuildSideBar({Key? key}) : super(key: key);

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

            const TextPatientsSideBar(),
            const SizedBox(height: 10),

            ButtonNewAppointmentSideBar(),
            const SizedBox(height: kSpacing),

            ButtonRegisterPatientSideBar(),
            const SizedBox(height: kSpacing),

            const Divider(height: 30,),

            const TextDoctorSideBar(),
            const SizedBox(height: 10),

            ButtonNewDateDoctorSideBar(),
            const SizedBox(height: kSpacing),

          ],
        ),

        BaseboardSideBar()
      ],
    );
  }
}
