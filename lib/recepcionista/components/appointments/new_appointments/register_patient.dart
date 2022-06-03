import 'package:centralcareweb/recepcionista/components/appointments/new_appointments/components/fields/field_birthday.dart';
import 'package:centralcareweb/recepcionista/components/appointments/new_appointments/components/fields/field_email.dart';
import 'package:centralcareweb/recepcionista/components/appointments/new_appointments/components/fields/field_last_name.dart';
import 'package:centralcareweb/recepcionista/components/appointments/new_appointments/components/fields/field_name.dart';
import 'package:centralcareweb/recepcionista/components/appointments/new_appointments/components/selects/select_gender.dart';
import 'package:flutter/material.dart';

import '../../../../constans/app_constants.dart';
import 'components/Buttons/button_continue.dart';

class RegisterPatient extends StatelessWidget {
  const RegisterPatient({Key? key, required this.step_one}) : super(key: key);

  final bool step_one;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: step_one,
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          FormFieldName(),
          const SizedBox(
            height: kSpacing,
          ),
          FormFielLastName(),
          const SizedBox(
            height: kSpacing,
          ),
          FormFieldEmail(),
          const SizedBox(
            height: kSpacing,
          ),
          FormFieldBirthday(),
          const SizedBox(
            height: kSpacing,
          ),
          SelectGender(),
          const SizedBox(
            height: kSpacing,
          ),
          const ButtonContinue(),
        ],
      ),
    );
  }
}
