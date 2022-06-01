import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../store/recepcionista_page/appointments_doctor/details_appointments_doctor_store.dart';

class DetailsAppointments extends StatelessWidget {
  final DetailsAppointmentsDoctorStore detailsAppointmentsDoctorStore =  GetIt.I<DetailsAppointmentsDoctorStore>();

  DetailsAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    detailsAppointmentsDoctorStore.fetchDetailsAppointment();
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
