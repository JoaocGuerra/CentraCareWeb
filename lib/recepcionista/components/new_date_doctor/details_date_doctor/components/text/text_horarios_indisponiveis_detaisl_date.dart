import 'package:centralcareweb/components/custom_text.dart';
import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/details_date_doctor/details_date_doctor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../store/recepcionista_page/appointments_doctor/details_appointments/details_appointments_doctor_store.dart';

class TextHorariosIndisponiveisDetailsDate extends StatelessWidget {
  final DetailsDateDoctorStore detailsDateDoctorStore =  GetIt.I<DetailsDateDoctorStore>();

  TextHorariosIndisponiveisDetailsDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: detailsDateDoctorStore.maxWidth),
      child: Row(
        children: [
          const CustomText(text: "Horários indisponíveis: ",fontWeight: FontWeight.bold),
          CustomText(text: detailsDateDoctorStore.dateDetailsModel?.horarios_indisponiveis.toString() ?? ""),
        ],
      ),
    );
  }
}
