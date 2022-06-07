import 'package:centralcareweb/store/recepcionista_page/register_patient/register_patient_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../components/custom_textformfield.dart';
import '../../../../../../store/master_page/tabs/register_tab/register_tab_store.dart';

class FormFielLastName extends StatelessWidget {
  final RegisterPatientStore registerPatientStore =  GetIt.I<RegisterPatientStore>();

  FormFielLastName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: registerPatientStore.maxWidthBoxConstrains),
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
