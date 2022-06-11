import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../components/custom_textformfield.dart';
import '../../../../../../constans/app_constants.dart';
import '../../../../../../store/recepcionista_page/register_patient/register_patient_store.dart';

class FormFielLastNameRegisterPatient extends StatelessWidget {
  final RegisterPatientStore registerPatientStore =  GetIt.I<RegisterPatientStore>();
  FormFielLastNameRegisterPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidthBoxConstrains),
      child: CustomTextFormField(
        list: const [],
        textEditingController: registerPatientStore.lastNameController,
        isPasswordType: false,
        icon: Icons.person_pin_rounded,
        text: 'Sobrenome',
        textInputType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return "Sobrenome Inválido";
          }
          return null;
        },
      ),
    );
  }
}
