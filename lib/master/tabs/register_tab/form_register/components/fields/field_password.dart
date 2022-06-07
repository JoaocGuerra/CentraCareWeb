import 'package:centralcareweb/store/recepcionista_page/register_patient/register_patient_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../components/custom_textformfield.dart';

class FormFieldPassword extends StatelessWidget {
  final RegisterPatientStore registerPatientStore =  GetIt.I<RegisterPatientStore>();

  FormFieldPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: registerPatientStore.maxWidthBoxConstrains),
      child: CustomTextFormField(
        list: const [],
        textEditingController: registerPatientStore.passwordController,
        isPasswordType: false,
        icon: Icons.lock,
        text: 'Senha',
        textInputType: TextInputType.visiblePassword,
        validator: (value) {
          if (value!.isEmpty) {
            return "Senha Inválida";
          }
          return null;
        },
      ),
    );
  }
}
