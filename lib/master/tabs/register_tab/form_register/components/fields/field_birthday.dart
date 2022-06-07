import 'package:brasil_fields/brasil_fields.dart';
import 'package:centralcareweb/store/recepcionista_page/register_patient/register_patient_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../components/custom_textformfield.dart';
import '../../../../../../store/master_page/tabs/register_tab/register_tab_store.dart';

class FormFieldBirthday extends StatelessWidget {
  final RegisterPatientStore registerPatientStore =  GetIt.I<RegisterPatientStore>();

  FormFieldBirthday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: registerPatientStore.maxWidthBoxConstrains),
      child: CustomTextFormField(
        textEditingController: registerPatientStore.birthdayController,
        isPasswordType: false,
        icon: Icons.calendar_today,
        text: 'Data de Nascimento',
        textInputType: TextInputType.datetime,
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              value.length != 10) {
            return "Data Inválida. Formtato: DD/MM/AAAA";
          } else {
            int _dia = int.parse(value[0] + value[1]);
            int _mes = int.parse(value[3] + value[4]);
            int _ano = int.parse(value[6] +
                value[7] +
                value[8] +
                value[9]);
            if (!((_dia.compareTo(0) == 1 &&
                _dia.compareTo(32) == -1) &&
                (_mes.compareTo(0) == 1 &&
                    _mes.compareTo(13) == -1) &&
                (_ano.compareTo(DateTime.now().year) !=
                    1 &&
                    _ano.compareTo(1900) != -1))) {
              return "Data Inválida";
            }
          }
          return null;
        },
        list: [
          FilteringTextInputFormatter.digitsOnly,
          DataInputFormatter()
        ],
      ),
    );
  }
}
