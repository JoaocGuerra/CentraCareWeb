import 'package:centralcareweb/recepcionista/components/appointments/details_appointments/form_details/form_details.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../components/header_text.dart';
import '../../../../constans/app_constants.dart';
import '../../../../store/recepcionista_page/appointments_doctor/appointments_doctor_store.dart';
import '../../../../store/recepcionista_page/appointments_doctor/details_appointments_doctor_store.dart';

class DetailsAppointments extends StatelessWidget {
  final DetailsAppointmentsDoctorStore detailsAppointmentsDoctorStore =  GetIt.I<DetailsAppointmentsDoctorStore>();
  final AppointmentsDoctorStore appointmentsDoctorStore =  GetIt.I<AppointmentsDoctorStore>();
  DetailsAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: kSpacing),
        child: Column(
          children: [
            const SizedBox(height: kSpacing),
            Row(
              children:[
                IconButton(
                  icon: Icon(EvaIcons.arrowBack),
                  onPressed: () {
                    appointmentsDoctorStore.setShowDetailsAppointment(false);
                  },
                ),
                SizedBox(width: 10,),
                Expanded(child: HeaderText(
                    "Cod. Dia: "+ detailsAppointmentsDoctorStore.diaMesAno+
                    ", Cod. Paciente: "+ detailsAppointmentsDoctorStore.codigoPaciente
                )),
              ],
            ),
            // const SizedBox(height: 50,),
            Center(
              child: FormDetails(),
            )
          ],
        ),
      );
    });
  }
}
