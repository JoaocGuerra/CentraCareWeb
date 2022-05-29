import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../components/custom_textformfield.dart';
import '../../../../../../store/tabs/register_tab/register_tab_store.dart';

class FormFieldSpecialty extends StatelessWidget {
  final RegisterTabStore registerTabStore =  GetIt.I<RegisterTabStore>();

  FormFieldSpecialty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: registerTabStore.maxWidthBoxConstrains),
      child: CustomTextFormField(
        list: const [],
        textEditingController: registerTabStore.specialtyController,
        isPasswordType: false,
        icon: Icons.wallet_travel,
        text: 'Especialidade',
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return "Especialidade Inválida";
          }
          return null;
        },
      ),
    );
  }
}
