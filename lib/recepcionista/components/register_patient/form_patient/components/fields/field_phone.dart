import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../components/custom_textformfield.dart';
import '../../../../../../store/recepcionista_page/register_patient/register_patient_store.dart';

class FormFieldPhone extends StatelessWidget {
  final RegisterPatientStore registerPatientStore =  GetIt.I<RegisterPatientStore>();

  FormFieldPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: registerPatientStore.maxWidthBoxConstrains),
      child: CustomTextFormField(
        textEditingController: registerPatientStore.phoneController,
        isPasswordType: false,
        icon: Icons.phone_android,
        text: 'Telefone',
        textInputType: TextInputType.phone,
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              value.length < 14) {
            return "Número Inválido";
          }
          return null;
        },
        list: [
          FilteringTextInputFormatter.digitsOnly,
          TelefoneInputFormatter()
        ],
      ),
    );
  }
}
