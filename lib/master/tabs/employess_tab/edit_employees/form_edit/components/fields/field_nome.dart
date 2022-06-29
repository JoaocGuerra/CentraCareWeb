import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../components/custom_text.dart';
import '../../../../../../../components/custom_textformfield.dart';
import '../../../../../../../store/master_page/tabs/employees_tab/edit_employees/edit_employees_store.dart';

class FormFieldEditNome extends StatelessWidget {
  final EditEmployeesStore editEmployeesStore =  GetIt.I<EditEmployeesStore>();

  FormFieldEditNome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: editEmployeesStore.maxWidthBoxConstrains),
      child: Row(
        children: [
          Expanded(child: CustomTextFormField(
            list: const [],
            textEditingController: editEmployeesStore.nomeController,
            isPasswordType: false,
            icon: Icons.person,
            text: editEmployeesStore.dataEmployee?.nome ?? "",
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
