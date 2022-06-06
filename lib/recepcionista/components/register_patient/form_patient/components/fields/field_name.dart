import 'package:flutter/material.dart';

import '../../../../../../components/custom_textformfield.dart';
import '../../../../../../constans/app_constants.dart';

class FormFieldName extends StatelessWidget {
  FormFieldName({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidthBoxConstrains),
      child: CustomTextFormField(
        list: const [],
        textEditingController: nameController,
        isPasswordType: false,
        icon: Icons.person,
        text: 'Nome',
        textInputType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return "Nome Inválido";
          }
          return null;
        },
      ),
    );
  }
}
