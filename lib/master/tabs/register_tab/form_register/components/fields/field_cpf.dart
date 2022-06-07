import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../components/custom_textformfield.dart';
import '../../../../../../store/master_page/tabs/register_tab/register_tab_store.dart';

class FormFieldCpf extends StatelessWidget {
  final RegisterTabStore registerTabStore =  GetIt.I<RegisterTabStore>();

  FormFieldCpf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: registerTabStore.maxWidthBoxConstrains),
      child: CustomTextFormField(
        list: [
          FilteringTextInputFormatter.digitsOnly,
          CpfInputFormatter()
        ],
        textEditingController: registerTabStore.cpfController,
        isPasswordType: false,
        icon: Icons.numbers,
        text: 'CPF',
        textInputType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return "CPF Inválido";
          }
          return null;
        },
      ),
    );
  }
}
