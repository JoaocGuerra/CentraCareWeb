import 'package:centralcareweb/master/tabs/register_tab/form_register/components/fields/field_password.dart';
import 'package:centralcareweb/recepcionista/components/new_date_doctor/details_date_doctor/components/buttons/button_deselect_date.dart';
import 'package:centralcareweb/recepcionista/components/new_date_doctor/details_date_doctor/components/text/text_form_details_date.dart';
import 'package:centralcareweb/recepcionista/components/new_date_doctor/details_date_doctor/components/text/text_horarios_indisponiveis_detaisl_date.dart';
import 'package:centralcareweb/recepcionista/components/new_date_doctor/details_date_doctor/components/text/text_inicio_fim_details_date.dart';
import 'package:centralcareweb/recepcionista/components/new_date_doctor/details_date_doctor/components/text/text_patients_details_date.dart';
import 'package:centralcareweb/recepcionista/components/new_date_doctor/form_new_date/components/buttons/button_register_new_date.dart';
import 'package:centralcareweb/recepcionista/components/new_date_doctor/form_new_date/components/others/select_interval.dart';
import 'package:centralcareweb/recepcionista/components/new_date_doctor/form_new_date/components/text/text_confirm_new_appointment.dart';
import 'package:centralcareweb/recepcionista/components/register_patient/form_patient/components/text/text_confirm.dart';
import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/details_date_doctor/details_date_doctor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../utils/utils_datetime.dart';
import '../../../appointments/details_appointments/form_details/components/text/text_form_details.dart';
import 'others/posicao_em_atendimento.dart';

class BodyDetailsDateDoctor extends StatelessWidget {
  final DetailsDateDoctorStore detailsDateDoctorStore =  GetIt.I<DetailsDateDoctorStore>();

  BodyDetailsDateDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_){
          return detailsDateDoctorStore.loading ?
          const Center(
            child: CircularProgressIndicator(),
          )
              :
          Column(
            children: [
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextFormDetailsDate(),
                  const SizedBox(width: 30,),
                  PosicaoEmAtendimento()
                ],
              ),
              const SizedBox(height: 40,),

              TextInicioFimDetailsDate(),
              const SizedBox(height: 20,),

              TextHorariosIndisponiveisDetailsDate(),
              const SizedBox(height: 20,),

              TextPatientsDetailsDate(),
              const SizedBox(height: 20,),
              Visibility(
                visible: !(detailsDateDoctorStore.diaMesAno == UtilsDateTime.getDatetimeNow()),
                child: ButtonDeselectDate()
              )
            ],
          );
        }
    );
  }
}
