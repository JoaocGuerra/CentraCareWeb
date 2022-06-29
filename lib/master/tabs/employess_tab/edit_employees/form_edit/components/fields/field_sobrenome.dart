import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../components/custom_text.dart';
import '../../../../../../../components/custom_textformfield.dart';
import '../../../../../../../store/master_page/tabs/employees_tab/edit_employees/edit_employees_store.dart';

class FormFieldEditSobrenome extends StatelessWidget {
  final EditEmployeesStore editEmployeesStore =  GetIt.I<EditEmployeesStore>();

  FormFieldEditSobrenome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: editEmployeesStore.maxWidthBoxConstrains),
      child: Row(
        children: [
          Expanded(child: CustomTextFormField(
            list: const [],
            textEditingController: editEmployeesStore.sobrenomeController,
            isPasswordType: false,
            icon: Icons.person_pin_rounded,
            text: editEmployeesStore.dataEmployee?.sobrenome ?? "",
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
