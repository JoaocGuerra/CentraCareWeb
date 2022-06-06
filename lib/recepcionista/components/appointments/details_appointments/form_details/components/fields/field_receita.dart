import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../components/custom_text.dart';
import '../../../../../../../components/custom_textformfield.dart';
import '../../../../../../../store/recepcionista_page/appointments_doctor/details_appointments/details_appointments_doctor_store.dart';

class FormFieldDetailsReceita extends StatelessWidget {
  final DetailsAppointmentsDoctorStore detailsAppointmentsDoctorStore =  GetIt.I<DetailsAppointmentsDoctorStore>();

  FormFieldDetailsReceita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: detailsAppointmentsDoctorStore.maxWidthBoxConstrains),
      child: Row(
        children: [
          const CustomText(text: "Receita"),
          Expanded(child: CustomTextFormField(
            list: const [],
            textEditingController: detailsAppointmentsDoctorStore.receitaController,
            isPasswordType: false,
            icon: Icons.book,
            text: detailsAppointmentsDoctorStore.appointmentModel?.receita ?? "",
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
