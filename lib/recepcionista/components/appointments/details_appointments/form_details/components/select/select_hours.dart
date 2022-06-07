import 'package:centralcareweb/store/recepcionista_page/appointments_doctor/details_appointments/details_appointments_doctor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:group_button/group_button.dart';

import '../../../../../../../store/api/horas_disponiveis_store.dart';

class SelectHours extends StatelessWidget {
  final HorasDisponiveisStore horasDisponiveisStore = GetIt.I<HorasDisponiveisStore>();
  final DetailsAppointmentsDoctorStore detailsAppointmentsDoctorStore = GetIt.I<DetailsAppointmentsDoctorStore>();

  SelectHours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    horasDisponiveisStore.fetchHoursDoctor(
        detailsAppointmentsDoctorStore.codigoMedico,
        detailsAppointmentsDoctorStore.diaMesAno);
    return Observer(
      builder: (_){
        return Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: SizedBox(
            width: detailsAppointmentsDoctorStore.maxWidthBoxConstrains,
            height: 100,
            child: horasDisponiveisStore.loading ?
            const Center(
              child: CircularProgressIndicator(),
            )
                :
            GroupButton(
              buttons: horasDisponiveisStore.dataHoursDoctor,
              maxSelected: 1,
              onSelected: (i, selected){
                detailsAppointmentsDoctorStore.setSelectedHour(horasDisponiveisStore.dataHoursDoctor[i]);
              },
              options: GroupButtonOptions(
                textAlign: TextAlign.center,
                elevation: 2,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        );
      },
    );
  }
}