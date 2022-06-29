import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../constans/app_constants.dart';
import '../../../../../../store/recepcionista_page/register_patient/register_patient_store.dart';

class SelectGenderPatient extends StatelessWidget {
  final RegisterPatientStore registerPatientStore =  GetIt.I<RegisterPatientStore>();
  SelectGenderPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidthBoxConstrains),
        child: Container(
          padding: const EdgeInsets.only(right: 10, left: 10),
          decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.7),
              borderRadius: BorderRadius.circular(90)),
          height: 51,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  registerPatientStore.gender,
                  style: TextStyle(
                      fontSize: 17, color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
            PopupMenuButton<GenderPatient>(
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 30,
                ),
                onSelected: (GenderPatient item) {
                  registerPatientStore.setGender(item.name);
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<GenderPatient>>[
                      const PopupMenuItem<GenderPatient>(
                        value: GenderPatient.MASCULINO,
                        child: Text('MASCULINO'),
                      ),
                      const PopupMenuItem<GenderPatient>(
                        value: GenderPatient.FEMININO,
                        child: Text('FEMININO'),
                      ),
                      const PopupMenuItem<GenderPatient>(
                        value: GenderPatient.OUTRO,
                        child: Text('OUTRO'),
                      ),
                    ])
          ]),
        ),
      );
    });
  }
}
