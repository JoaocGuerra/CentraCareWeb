import 'package:centralcareweb/master/tabs/employess_tab/edit_employees/form_edit/components/fields/field_nascimento.dart';
import 'package:centralcareweb/store/master_page/tabs/employees_tab/edit_employees/edit_employees_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'components/button/button_update_employee.dart';
import 'components/fields/field_cpf.dart';
import 'components/fields/field_especialidade.dart';
import 'components/fields/field_nome.dart';
import 'components/fields/field_sobrenome.dart';

class FormEditEmployee extends StatelessWidget {
  final EditEmployeesStore editEmployeesStore =  GetIt.I<EditEmployeesStore>();
  final _formKey = GlobalKey<FormState>();

  FormEditEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_){
          return editEmployeesStore.loading ?
          const Center(
            child: CircularProgressIndicator(),
          )
              :
          Form(
            key: _formKey,
            child: Wrap(
              children: [
                Center(
                  child:Column(
                    children: [

                      FormFieldEditNome(),
                      const SizedBox(height: 20,),

                      FormFieldEditSobrenome(),
                      const SizedBox(height: 20,),

                      FormFieldEditCPF(),
                      const SizedBox(height: 20,),

                      FormFieldEditNascimento(),
                      const SizedBox(height: 20,),

                      Visibility(
                        visible: editEmployeesStore.employeeIsDoctor,
                        child: Column(
                          children: [
                            FormFieldEditEspecialidade(),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      ),

                      ButtonUpdateEmployee(),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
