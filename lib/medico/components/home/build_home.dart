import 'package:centralcareweb/medico/components/home/appointment_card.dart';
import 'package:centralcareweb/medico/components/home/texts/patients_left.dart';
import 'package:centralcareweb/medico/components/home/texts/resume.dart';
import 'package:centralcareweb/store/medico_page/query_doctor/query_doctor_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../components/header_text.dart';
import '../../../constans/app_constants.dart';

class BuildHome extends StatelessWidget {
  final QueryDoctorStore queryDoctorStore =  GetIt.I<QueryDoctorStore>();
  BuildHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    queryDoctorStore.fetchQueryDoctor();
    return Observer(
        builder: (_){
          return SingleChildScrollView(
            controller: ScrollController(initialScrollOffset: 0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kSpacing),
                  Row(
                    children: const [
                      Expanded(child: HeaderText("Início")),
                      Icon(
                        EvaIcons.homeOutline,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: kSpacing,
                  ),
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: 500,
                      child: ListView.builder(
                        itemCount: queryDoctorStore.namesQuerys.length,
                        itemBuilder: (context,i){
                          String nameQuery = queryDoctorStore.namesQuerys[i];
                          String quantityPatients =
                            queryDoctorStore.querys[nameQuery]['pacientes'] == 1 ?
                            "1 paciente"
                              :
                            queryDoctorStore.querys[nameQuery]['pacientes'].toString()+" pacientes";

                          return AppointmentCard(
                            label: nameQuery,
                            dayMonthYear: queryDoctorStore.querys[nameQuery]['dia_mes_ano'],
                            details: quantityPatients,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );

    });
  }
}
