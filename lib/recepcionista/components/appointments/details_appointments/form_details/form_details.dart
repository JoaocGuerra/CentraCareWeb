import 'package:centralcareweb/recepcionista/components/appointments/details_appointments/form_details/components/button/button_deselect_query.dart';
import 'package:centralcareweb/recepcionista/components/appointments/details_appointments/form_details/components/button/button_update_appointment.dart';
import 'package:centralcareweb/recepcionista/components/appointments/details_appointments/form_details/components/fields/field_status.dart';
import 'package:centralcareweb/recepcionista/components/appointments/details_appointments/form_details/components/fields/field_termino.dart';
import 'package:centralcareweb/recepcionista/components/appointments/details_appointments/form_details/components/others/posicao_fila.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../store/recepcionista_page/appointments_doctor/details_appointments/details_appointments_doctor_store.dart';
import 'components/select/select_hours.dart';
import 'components/others/inicio_details.dart';
import 'components/text/text_form_details.dart';
import 'components/text/text_name_details.dart';

class FormDetails extends StatelessWidget {
  final DetailsAppointmentsDoctorStore detailsAppointmentsDoctorStore =  GetIt.I<DetailsAppointmentsDoctorStore>();
  final _formKey = GlobalKey<FormState>();

  FormDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    detailsAppointmentsDoctorStore.fetchDetailsAppointment();
    detailsAppointmentsDoctorStore.setChangeHours(false);
    return Observer(
        builder: (_){
          return detailsAppointmentsDoctorStore.loading ?
          const Center(
            child: CircularProgressIndicator(),
          )
              :
          Form(
            key: _formKey,
            child: Wrap(
              children: [
                Center(
                  child:Column(
                    children: [
                      const SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TextFormDetails(),
                          const SizedBox(width: 30,),
                          PosicaoFila()
                        ],
                      ),
                      const SizedBox(height: 40,),

                      TextNameDetails(),
                      const SizedBox(height: 20,),

                      InicioDetails(),
                      const SizedBox(height: 20,),

                      Visibility(
                        visible: detailsAppointmentsDoctorStore.changeHours,
                        child: SelectHours(),
                      ),

                      FormFieldDetailsTermino(),
                      const SizedBox(height: 20,),

                      FormFieldDetailsStatus(),
                      const SizedBox(height: 20,),

                      ButtonUpdateAppointment(),
                      const SizedBox(height: 5),

                      Visibility(
                        visible: detailsAppointmentsDoctorStore.appointmentModel?.status=="marcada",
                          child: ButtonDeselectQuery()
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
