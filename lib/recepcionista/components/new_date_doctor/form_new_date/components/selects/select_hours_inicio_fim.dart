
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../store/recepcionista_page/new_date_doctor/new_date_doctor_store.dart';


class SelectHoursInicioFim extends StatelessWidget {
  final NewDateDoctorStore newDateDoctorStore =  GetIt.I<NewDateDoctorStore>();
  SelectHoursInicioFim({Key? key}) : super(key: key);

  void _selectTime(BuildContext context, bool initial) async {
    final TimeOfDay? newTime =
    await showTimePicker(
      builder: (context,child){
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? Container(),
        );
      },
      context: context,
      initialTime: initial ? TimeOfDay(hour: 8, minute: 0) : TimeOfDay(hour: 18, minute: 0),
    );
    if (newTime != null) {
      String newTimeStr = newTime.toString()
          .replaceAll("TimeOfDay(", "")
          .replaceAll(")", "");

      initial ? newDateDoctorStore.setInicioAtendimento(newTimeStr) : newDateDoctorStore.setFinalAtendimento(newTimeStr);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder:(_){
      return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: newDateDoctorStore.maxWidth),
        child: Row(
          children: [
            TextButton(
                onPressed: (){
                  _selectTime(context,true);
                },
                child: Row(
                  children: const [
                    Icon(Icons.hourglass_empty_sharp),
                    Text("Inicio")
                  ],
                )
            ),
            Text(newDateDoctorStore.inicioAtendimento),
            SizedBox(width: 100,),
            TextButton(
                onPressed: (){
                  _selectTime(context,false);
                },
                child: Row(
                  children: const [
                    Icon(Icons.hourglass_full),
                    Text("Final")
                  ],
                )
            ),
            Text(newDateDoctorStore.finalAtendimento)
          ],
        ),
      );
    });
  }
}
