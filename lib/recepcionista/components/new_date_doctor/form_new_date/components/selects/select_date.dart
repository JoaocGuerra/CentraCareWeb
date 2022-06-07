import 'package:centralcareweb/utils/utils_datetime.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../../store/recepcionista_page/new_date_doctor/new_date_doctor_store.dart';

class SelectDateAppointment extends StatelessWidget {
  final NewDateDoctorStore newDateDoctorStore =  GetIt.I<NewDateDoctorStore>();

  SelectDateAppointment({Key? key}) : super(key: key);

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    newDateDoctorStore.dataAtendimento = UtilsDateTime.convertDatetimeSepairWithBar(args.value.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: newDateDoctorStore.maxWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Selecione a data do atendimento",style: TextStyle(fontWeight: FontWeight.bold),),
          Divider(),
          SfDateRangePicker(
            minDate: DateTime.now(),
            onSelectionChanged: _onSelectionChanged,
          ),
          Divider()
        ],
      ),
    );
  }
}
