
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../store/recepcionista_page/new_date_doctor/new_date_doctor_store.dart';


class SelectHoursUnavailable extends StatelessWidget {
  final NewDateDoctorStore newDateDoctorStore =  GetIt.I<NewDateDoctorStore>();
  SelectHoursUnavailable({Key? key}) : super(key: key);

  void _selectTime(BuildContext context) async {
    final TimeOfDay? newTime =
    await showTimePicker(
      builder: (context,child){
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? Container(),
        );
      },
      context: context,
      initialTime: TimeOfDay(hour: 8, minute: 0),
    );
    if (newTime != null) {
      newDateDoctorStore.setHoraSelecioanda(newTime.toString()
          .replaceAll("TimeOfDay(", "")
          .replaceAll(")", ""));
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
                  _selectTime(context);
                },
                child: Row(
                  children: const [
                    Icon(Icons.hourglass_disabled),
                    Text("Horas indisp.")
                  ],
                )
            ),
            Text(newDateDoctorStore.horaSelecionada),
            TextButton(
                onPressed: (){
                  newDateDoctorStore.setHorasIndisponiveis(newDateDoctorStore.horaSelecionada);
                },
                child: Text("Adicionar")
            ),
            Text(newDateDoctorStore.horasIndisponiveis.toString())
          ],
        ),
      );
    });
  }
}
