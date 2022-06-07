
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../store/recepcionista_page/new_date_doctor/new_date_doctor_store.dart';


class IntervalAppointments extends StatelessWidget {
  final NewDateDoctorStore newDateDoctorStore =  GetIt.I<NewDateDoctorStore>();
  IntervalAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: newDateDoctorStore.maxWidth),
      child: Row(
        children: [
          const Text("Intervalo entre os atendimentos: ",style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10,),
          SizedBox(
            width: 30,
            child: TextFormField(
              controller: newDateDoctorStore.intervaloController,
              keyboardType: TextInputType.number,
            ),
          )
        ],
      ),
    );
  }
}
