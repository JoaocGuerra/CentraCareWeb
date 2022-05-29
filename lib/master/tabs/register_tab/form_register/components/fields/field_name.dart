import 'package:centralcareweb/store/tabs/register_tab/register_tab_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../components/custom_textformfield.dart';

class FormFieldName extends StatelessWidget {
  final RegisterTabStore registerTabStore =  GetIt.I<RegisterTabStore>();

  FormFieldName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: registerTabStore.maxWidthBoxConstrains),
      child: CustomTextFormField(
        list: const [],
        textEditingController: registerTabStore.nameController,
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
