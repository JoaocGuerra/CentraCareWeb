import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../components/custom_textformfield.dart';
import '../../../../../../store/register_tab_store.dart';

class FormFielLastName extends StatelessWidget {
  final RegisterTabStore registerTabStore =  GetIt.I<RegisterTabStore>();

  FormFielLastName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: registerTabStore.maxWidthBoxConstrains),
      child: CustomTextFormField(
        list: const [],
        textEditingController: registerTabStore.lastNameController,
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
