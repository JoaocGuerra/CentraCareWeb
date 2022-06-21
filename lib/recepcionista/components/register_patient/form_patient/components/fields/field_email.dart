import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../components/custom_textformfield.dart';
import '../../../../../../constans/app_constants.dart';
import '../../../../../../store/recepcionista_page/register_patient/register_patient_store.dart';

class FormFieldEmailRegisterPatient extends StatelessWidget {
  final RegisterPatientStore registerPatientStore =  GetIt.I<RegisterPatientStore>();
  FormFieldEmailRegisterPatient({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidthBoxConstrains),
      child: CustomTextFormField(
        list: const [],
        textEditingController: registerPatientStore.emailController,
        isPasswordType: false,
        icon: Icons.mail,
        text: 'Email',
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return "Email Inválido";
          }
          return null;
        },
      ),
    );
  }
}
