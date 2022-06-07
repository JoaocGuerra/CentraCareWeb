import 'package:centralcareweb/components/custom_text.dart';
import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/details_date_doctor/details_date_doctor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../store/recepcionista_page/appointments_doctor/details_appointments/details_appointments_doctor_store.dart';

class TextPatientsDetailsDate extends StatelessWidget {
  final DetailsDateDoctorStore detailsDateDoctorStore =  GetIt.I<DetailsDateDoctorStore>();

  TextPatientsDetailsDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: detailsDateDoctorStore.maxWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const CustomText(text: "Lista de pacientes: ",fontWeight: FontWeight.bold),
              CustomText(text: detailsDateDoctorStore.dateDetailsModel?.pacientes.length.toString() ?? ""),
            ],
          ),
          const SizedBox(height: 10,),
          CustomText(text: detailsDateDoctorStore.dateDetailsModel?.pacientes.toString() ?? ""),
        ],
      ),
    );
  }
}
