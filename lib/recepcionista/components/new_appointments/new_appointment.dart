import 'package:centralcareweb/components/header_text.dart';
import 'package:centralcareweb/recepcionista/components/new_appointments/components/select/select_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../store/recepcionista_page/new_appointment/marcar_consulta_store.dart';
import 'components/button/button_confirm_consult.dart';
import 'components/select/select_date.dart';
import 'components/select/select_doctor.dart';
import 'components/select/select_specialty.dart';
import 'components/select/select_hours.dart';
import 'components/text/text_confirm_new_appointment.dart';

class NewAppointment extends StatelessWidget {
  final MarcarConsultaStore marcarConsultaStore = GetIt.I<MarcarConsultaStore>();

  NewAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return marcarConsultaStore.loadingNewAppointmentPage ?
      const Center(
        child: CircularProgressIndicator(),
      )
        :
      Column(
        children: [
          const SizedBox(height: 30,),
          Visibility(
            visible: marcarConsultaStore.appointmentRegister,
            child: TexteConfirmNewAppointment(),
          ),
          const SizedBox(height: 10,),
          SelectUsers(),
          const SizedBox(height: 15,),

          SelectSpecialty(),
          const SizedBox(height: 15,),

          Visibility(
            visible: marcarConsultaStore
                .selectedSpecialty.isNotEmpty,
            child: SelectDoctor(),
          ),
          const SizedBox(height: 15),

          Visibility(
            visible:
            marcarConsultaStore.selectedDoctor !=
                "",
            child: SelectDate(),
          ),
          const SizedBox(height: 15),

          Visibility(
            visible:
            marcarConsultaStore.selectedDate != "",
            child: SelectHours(),
          ),
          const SizedBox(height: 15),

          Visibility(
            visible:
            marcarConsultaStore.isFilled,
            child: ButtonConfirmConsult(),
          ),
          const SizedBox(height: 15),
        ],
      );
    });
  }
}
