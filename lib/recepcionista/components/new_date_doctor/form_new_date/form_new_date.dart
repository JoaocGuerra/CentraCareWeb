import 'package:centralcareweb/master/tabs/register_tab/form_register/components/fields/field_password.dart';
import 'package:centralcareweb/recepcionista/components/new_date_doctor/form_new_date/components/buttons/button_register_new_date.dart';
import 'package:centralcareweb/recepcionista/components/new_date_doctor/form_new_date/components/others/select_interval.dart';
import 'package:centralcareweb/recepcionista/components/new_date_doctor/form_new_date/components/text/text_confirm_new_appointment.dart';
import 'package:centralcareweb/recepcionista/components/register_patient/form_patient/components/text/text_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../store/recepcionista_page/new_date_doctor/new_date_doctor_store.dart';
import '../../../../store/recepcionista_page/register_patient/register_patient_store.dart';
import 'components/selects/select_date.dart';
import 'components/selects/select_doctor.dart';
import 'components/selects/select_hours_inicio_fim.dart';
import 'components/selects/select_hours_unavailable.dart';

class FormNewDate extends StatelessWidget {
  final NewDateDoctorStore newDateDoctorStore =  GetIt.I<NewDateDoctorStore>();
  FormNewDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_){
          return newDateDoctorStore.loading ?
          const Center(
            child: CircularProgressIndicator(),
          )
              :
          Column(
            children: [
              const SizedBox(height: 30,),
              Visibility(
                visible: newDateDoctorStore.dateRegister,
                child: TexteConfirmNewDate(),
              ),
              const SizedBox(height: 10,),
              SelectDoctorNewDate(),

              const SizedBox(height: 20,),
              SelectDateAppointment(),

              SelectHoursInicioFim(),
              const SizedBox(height: 20,),

              SelectHoursUnavailable(),
              const SizedBox(height: 20,),

              IntervalAppointments(),
              const SizedBox(height: 20,),

              Visibility(
                visible: newDateDoctorStore.isFilled,
                child: ButtonRegisterNewDate(),
              ),
              const SizedBox(height: 20,),
            ],
          );
        }
    );
  }
}
