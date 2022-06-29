import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../components/custom_text.dart';
import '../../../../../../../components/custom_textformfield.dart';
import '../../../../../../../store/master_page/tabs/employees_tab/edit_employees/edit_employees_store.dart';

class FormFieldEditEspecialidade extends StatelessWidget {
  final EditEmployeesStore editEmployeesStore =  GetIt.I<EditEmployeesStore>();

  FormFieldEditEspecialidade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: editEmployeesStore.maxWidthBoxConstrains),
      child: Row(
        children: [
          Expanded(child: CustomTextFormField(
            list: const [],
            textEditingController: editEmployeesStore.especialidadeController,
            isPasswordType: false,
            icon: Icons.monitor_heart,
            text: editEmployeesStore.dataEmployee?.especialidade ?? "",
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
