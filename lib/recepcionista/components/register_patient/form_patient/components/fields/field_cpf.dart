import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../components/custom_textformfield.dart';
import '../../../../../../constans/app_constants.dart';
import '../../../../../../store/recepcionista_page/register_patient/register_patient_store.dart';

class FormFieldCPFRegisterPatient extends StatelessWidget {
  final RegisterPatientStore registerPatientStore =  GetIt.I<RegisterPatientStore>();
  FormFieldCPFRegisterPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidthBoxConstrains),
      child: CustomTextFormField(
        list: [
          FilteringTextInputFormatter.digitsOnly,
          CpfInputFormatter()
        ],
        textEditingController: registerPatientStore.cpfController,
        isPasswordType: false,
        icon: Icons.numbers,
        text: "CPF",
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return "CPF Inválido";
          }
          return null;
        },
      ),
    );
  }
}