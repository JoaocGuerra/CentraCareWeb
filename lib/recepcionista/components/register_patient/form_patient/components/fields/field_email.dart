import 'package:flutter/material.dart';

import '../../../../../../components/custom_textformfield.dart';
import '../../../../../../constans/app_constants.dart';

class FormFieldEmail extends StatelessWidget {
  FormFieldEmail({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidthBoxConstrains),
      child: CustomTextFormField(
        list: const [],
        textEditingController: emailController,
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
