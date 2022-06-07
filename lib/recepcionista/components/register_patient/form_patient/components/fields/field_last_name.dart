import 'package:flutter/material.dart';

import '../../../../../../components/custom_textformfield.dart';
import '../../../../../../constans/app_constants.dart';

class FormFielLastName extends StatelessWidget {
  FormFielLastName({Key? key}) : super(key: key);

  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidthBoxConstrains),
      child: CustomTextFormField(
        list: const [],
        textEditingController: lastNameController,
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
