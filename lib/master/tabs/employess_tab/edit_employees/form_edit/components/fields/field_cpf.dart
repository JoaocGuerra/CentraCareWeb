import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../components/custom_textformfield.dart';
import '../../../../../../../store/master_page/tabs/employees_tab/edit_employees/edit_employees_store.dart';

class FormFieldEditCPF extends StatelessWidget {
  final EditEmployeesStore editEmployeesStore =  GetIt.I<EditEmployeesStore>();

  FormFieldEditCPF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: editEmployeesStore.maxWidthBoxConstrains),
      child: Row(
        children: [
          Expanded(child: CustomTextFormField(
            list: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter()
            ],
            textEditingController: editEmployeesStore.cpfController,
            isPasswordType: false,
            icon: Icons.numbers,
            text: editEmployeesStore.dataEmployee?.cpf ?? "",
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return "Campo Inválido";
              }
              return null;
            },
          ))
        ],
      ),
    );
  }
}
