import 'package:centralcareweb/master/tabs/register_tab/form_register/components/button_register.dart';
import 'package:centralcareweb/master/tabs/register_tab/form_register/components/forms/form_field_birthday.dart';
import 'package:centralcareweb/master/tabs/register_tab/form_register/components/forms/form_field_cpf.dart';
import 'package:centralcareweb/master/tabs/register_tab/form_register/components/forms/form_field_email.dart';
import 'package:centralcareweb/master/tabs/register_tab/form_register/components/forms/form_field_specialty.dart';
import 'package:centralcareweb/master/tabs/register_tab/form_register/components/select/select_function.dart';
import 'package:centralcareweb/master/tabs/register_tab/form_register/components/select/select_gender.dart';
import 'package:centralcareweb/master/tabs/register_tab/form_register/components/text_form.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../store/register_tab_store.dart';
import 'components/forms/form_field_last_name.dart';
import 'components/forms/form_field_name.dart';

class FormRegister extends StatelessWidget {
  final RegisterTabStore registerTabStore =  GetIt.I<RegisterTabStore>();
  final _formKey = GlobalKey<FormState>();

  FormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Wrap(
        children: [
          Center(
            child: Column(
              children: [
                TextForm(),
                const SizedBox(height: 40,),

                FormFieldName(),
                const SizedBox(height: 10,),

                FormFielLastName(),
                const SizedBox(height: 10,),

                FormFieldEmail(),
                const SizedBox(height: 10,),

                FormFieldCpf(),
                const SizedBox(height: 10,),

                FormFieldBirthday(),
                const SizedBox(height: 10,),

                SelectGender(),
                const SizedBox(height: 10,),

                SelectFunction(),
                const SizedBox(height: 10,),

                Visibility(
                  visible: registerTabStore.function == Function.MEDICO.name,
                  child: FormFieldSpecialty(),
                ),
                const SizedBox(height: 10),

                ButtonRegister()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
