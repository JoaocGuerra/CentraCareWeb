import 'package:centralcareweb/medico/components/next_patient/next_patient_card.dart';
import 'package:centralcareweb/store/medico_page/next_patients/next_patients_store.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../components/header_text.dart';
import '../../../constans/app_constants.dart';

class BuildNextPatients extends StatelessWidget {
  final NextPatientsStore nextPatientsStore =  GetIt.I<NextPatientsStore>();

  BuildNextPatients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      Expanded(child: HeaderText("Próximos Pacientes (Hoje)")),
                      Icon(
                        EvaIcons.calendarOutline,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: kSpacing,
                  ),
                  nextPatientsStore.loading ?
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                      :
                  SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: nextPatientsStore.namePatients.length,
                        itemBuilder: (context,i){
                          return NextPatientCard(name: nextPatientsStore.namePatients[i]);
                        },
                      )
                  )
                ],
              ),
            ),
          );

        }
    );
  }
}
