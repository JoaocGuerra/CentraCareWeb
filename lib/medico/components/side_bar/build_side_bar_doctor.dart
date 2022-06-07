import 'package:centralcareweb/recepcionista/components/side_bar/components/button/button_new_date_doctor_side_bar.dart';
import 'package:centralcareweb/recepcionista/components/side_bar/components/others/baseboard_side_bar.dart';
import 'package:centralcareweb/recepcionista/components/side_bar/components/others/header_side_bar.dart';
import 'package:centralcareweb/recepcionista/components/side_bar/components/text/text_patient_side_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          ],
        ),

        BaseboardSideBar()
      ],
    );
  }
}
