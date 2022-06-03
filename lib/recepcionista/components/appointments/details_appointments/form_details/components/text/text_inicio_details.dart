import 'package:centralcareweb/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../store/recepcionista_page/appointments_doctor/details_appointments_doctor_store.dart';

class TextInicioDetails extends StatelessWidget {
  final DetailsAppointmentsDoctorStore detailsAppointmentsDoctorStore =  GetIt.I<DetailsAppointmentsDoctorStore>();

  TextInicioDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: detailsAppointmentsDoctorStore.maxWidthBoxConstrains),
      child: Row(
        children: [
          const CustomText(text: "Inicio da Consulta"),
          const SizedBox(width: 30,),
          CustomText(text: detailsAppointmentsDoctorStore.appointmentModel?.inicioConsulta ?? ""),
        ],
      ),
    );
  }
}
