import 'package:centralcareweb/master/tabs/register_tab/form_register/components/fields/field_password.dart';
import 'package:centralcareweb/recepcionista/components/register_patient/form_patient/components/fields/field_birthday.dart';
import 'package:centralcareweb/recepcionista/components/register_patient/form_patient/components/fields/field_email.dart';
import 'package:centralcareweb/recepcionista/components/register_patient/form_patient/components/fields/field_last_name.dart';
import 'package:centralcareweb/recepcionista/components/register_patient/form_patient/components/fields/field_name.dart';
import 'package:centralcareweb/recepcionista/components/register_patient/form_patient/components/fields/field_password.dart';
import 'package:centralcareweb/recepcionista/components/register_patient/form_patient/components/text/text_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../constans/app_constants.dart';
import '../../../../master/tabs/register_tab/form_register/components/fields/field_birthday.dart';
import '../../../../master/tabs/register_tab/form_register/components/fields/field_email.dart';
import '../../../../master/tabs/register_tab/form_register/components/fields/field_last_name.dart';
import '../../../../master/tabs/register_tab/form_register/components/fields/field_name.dart';
import '../../../../master/tabs/register_tab/form_register/components/select/select_gender.dart';
import '../../../../store/recepcionista_page/register_patient/register_patient_store.dart';
import 'components/Buttons/button_register_patient.dart';
import 'components/fields/field_phone.dart';

class FormPatient extends StatelessWidget {
  final RegisterPatientStore registerPatientStore =  GetIt.I<RegisterPatientStore>();
  FormPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_){
          return registerPatientStore.loading ?
          const Center(
            child: CircularProgressIndicator(),
          )
              :
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              FormFieldEmailRegisterPatient(),
              const SizedBox(
                height: kSpacing,
              ),

              FormFieldPasswordRegisterPatient(),
              const SizedBox(
                height: kSpacing,
              ),

              FormFieldNameRegisterPatient(),
              const SizedBox(
                height: kSpacing,
              ),

              FormFielLastNameRegisterPatient(),
              const SizedBox(
                height: kSpacing,
              ),

              SelectGender(),
              const SizedBox(
                height: kSpacing,
              ),

              FormFieldPhoneRegisterPatient(),
              const SizedBox(
                height: kSpacing,
              ),

              FormFieldBirthdayRegisterPatient(),
              const SizedBox(
                height: kSpacing,
              ),

              ButtonRegisterPatient(),
              const SizedBox(height: 5),
              Visibility(
                visible: registerPatientStore.patientRegister,
                child: const TextConfirmPatient(),
              )
            ],
          );
        }
    );
  }
}
