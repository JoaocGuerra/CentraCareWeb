import 'package:centralcareweb/components/custom_text.dart';
import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/details_date_doctor/details_date_doctor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../store/recepcionista_page/appointments_doctor/details_appointments/details_appointments_doctor_store.dart';

class TextInicioFimDetailsDate extends StatelessWidget {
  final DetailsDateDoctorStore detailsDateDoctorStore =  GetIt.I<DetailsDateDoctorStore>();

  TextInicioFimDetailsDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: detailsDateDoctorStore.maxWidth),
      child: Row(
        children: [
          const CustomText(text: "Inicio: ",fontWeight: FontWeight.bold),
          CustomText(text: detailsDateDoctorStore.dateDetailsModel?.inicio ?? ""),

          const SizedBox(width: 30,),

          const CustomText(text: "Fim: ",fontWeight: FontWeight.bold),
          CustomText(text: detailsDateDoctorStore.dateDetailsModel?.fim ?? ""),

          const SizedBox(width: 30,),

          const CustomText(text: "Intervalo: ",fontWeight: FontWeight.bold),
          CustomText(text: detailsDateDoctorStore.dateDetailsModel?.intervalo.toString() ?? ""),
        ],
      ),
    );
  }
}
