import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../store/recepcionista_page/appointments_doctor/details_appointments_doctor_store.dart';


class ButtonDeselectQuery extends StatelessWidget {
  final DetailsAppointmentsDoctorStore detailsAppointmentsDoctorStore =  GetIt.I<DetailsAppointmentsDoctorStore>();

  ButtonDeselectQuery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: detailsAppointmentsDoctorStore.maxWidthBoxConstrains),
      child: Container(
        height: 50,
        width: 300 ,
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.7),
            borderRadius: BorderRadius.circular(25)),
        child: TextButton(
          onPressed: () {
            detailsAppointmentsDoctorStore.deselectQuery();
          },
          child: const Center(
            child: Text(
              "Desmarcar Consulta",
              style: TextStyle(
                  color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
