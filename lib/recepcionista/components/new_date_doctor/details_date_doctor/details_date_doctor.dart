import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/details_date_doctor/details_date_doctor_store.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../components/header_text.dart';
import '../../../../constans/app_constants.dart';
import '../../../../store/show_pages/show_home_store.dart';
import 'components/body_details_date_doctor.dart';


class DetailsDateDoctor extends StatelessWidget {
  final ShowHomeStore showHomeStore =  GetIt.I<ShowHomeStore>();
  final DetailsDateDoctorStore detailsDateDoctorStore =  GetIt.I<DetailsDateDoctorStore>();
  final bool recepcionista;

  DetailsDateDoctor({Key? key, required this.recepcionista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    detailsDateDoctorStore.recepcionist = recepcionista;
    detailsDateDoctorStore.fetchDetailsDate();
    return Observer(builder: (_){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: kSpacing),
        child: Column(
          children: [
            const SizedBox(height: kSpacing),
            Row(
              children:[
                IconButton(
                  icon: Icon(EvaIcons.arrowBack),
                  onPressed: () {
                    detailsDateDoctorStore.recepcionist ?
                    showHomeStore.setShowInHomeReceptionist(1)
                        :
                    showHomeStore.setShowInHomeDoctor(1);
                  },
                ),
                SizedBox(width: 10,),
                Expanded(child: HeaderText(
                    "Cod. Dia: "+ detailsDateDoctorStore.diaMesAno+
                        ", Cod. Médico: "+ detailsDateDoctorStore.codigoMedico
                )),
              ],
            ),
            BodyDetailsDateDoctor(),
          ],
        ),
      );
    });
  }
}