import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../store/recepcionista_page/register_patient/register_patient_store.dart';

class ButtonRegisterPatient extends StatelessWidget {
  final RegisterPatientStore registerPatientStore =  GetIt.I<RegisterPatientStore>();
  ButtonRegisterPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)),
          child: TextButton(
            onPressed: () {
              registerPatientStore.insertPatient();
            },
            child: const Center(
              child: Text(
                "Cadastrar Paciente",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
        ));
  }
}
