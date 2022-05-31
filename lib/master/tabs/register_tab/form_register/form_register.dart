import 'package:centralcareweb/master/tabs/register_tab/form_register/components/button/button_register.dart';
import 'package:centralcareweb/master/tabs/register_tab/form_register/components/select/select_function.dart';
import 'package:centralcareweb/master/tabs/register_tab/form_register/components/select/select_gender.dart';
import 'package:centralcareweb/master/tabs/register_tab/form_register/components/text/text_confirm.dart';
import 'package:centralcareweb/master/tabs/register_tab/form_register/components/text/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../store/tabs/register_tab/register_tab_store.dart';
import 'components/fields/field_birthday.dart';
import 'components/fields/field_cpf.dart';
import 'components/fields/field_email.dart';
import 'components/fields/field_last_name.dart';
import 'components/fields/field_name.dart';
import 'components/fields/field_password.dart';
import 'components/fields/field_specialty.dart';

class FormRegister extends StatelessWidget {
  final RegisterTabStore registerTabStore =  GetIt.I<RegisterTabStore>();
  final _formKey = GlobalKey<FormState>();

  FormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_){
          return registerTabStore.loading ?
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
                        TextForm(),
                        const SizedBox(height: 40,),

                        FormFieldName(),
                        const SizedBox(height: 10,),

                        FormFielLastName(),
                        const SizedBox(height: 10,),

                        FormFieldEmail(),
                        const SizedBox(height: 10,),

                        FormFieldPassword(),
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

                        ButtonRegister(),
                        const SizedBox(height: 5),
                        Visibility(
                          visible: registerTabStore.userRegister,
                          child: const TextConfirm(),
                        )
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
