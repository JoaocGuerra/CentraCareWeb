import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/details_date_doctor/details_date_doctor_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../store/recepcionista_page/appointments_doctor/details_appointments/details_appointments_doctor_store.dart';

class ButtonDeselectDate extends StatelessWidget {
  final DetailsDateDoctorStore detailsDateDoctorStore =  GetIt.I<DetailsDateDoctorStore>();

  ButtonDeselectDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: detailsDateDoctorStore.maxWidth),
      child: Container(
        height: 50,
        width: 300 ,
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.7),
            borderRadius: BorderRadius.circular(25)),
        child: TextButton(
          onPressed: () {
            detailsDateDoctorStore.deselectDate();
          },
          child: const Center(
            child: Text(
              "Desmarcar Data",
              style: TextStyle(
                  color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
