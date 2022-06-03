import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../components/custom_text.dart';
import '../../../../../../../components/custom_textformfield.dart';
import '../../../../../../../store/recepcionista_page/appointments_doctor/details_appointments_doctor_store.dart';

class FormFieldDetailsTermino extends StatelessWidget {
  final DetailsAppointmentsDoctorStore detailsAppointmentsDoctorStore =  GetIt.I<DetailsAppointmentsDoctorStore>();

  FormFieldDetailsTermino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: detailsAppointmentsDoctorStore.maxWidthBoxConstrains),
      child: Row(
        children: [
          CustomText(text: "Final da Consulta"),
          Expanded(child: CustomTextFormField(
            list: const [],
            textEditingController: detailsAppointmentsDoctorStore.terminoController,
            isPasswordType: false,
            icon: Icons.hourglass_full,
            text: detailsAppointmentsDoctorStore.appointmentModel?.terminoConsulta ?? "",
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
