import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../constans/app_constants.dart';
import '../../../../store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';

class Anamnese extends StatelessWidget {
  final PatientOnAppointmentStore patientOnAppointmentStore = GetIt.I<PatientOnAppointmentStore>();
  Anamnese({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 0),
      child: Padding(
        padding: EdgeInsets.fromLTRB(50,30,50,50),
        child:Column(
          children:[
            generateFields("Queixa principal:",patientOnAppointmentStore.queixaPrincipalController,1),
            generateFields("História da doença atual:",patientOnAppointmentStore.historiaDoencaAtualController,4),
            generateFields("Revisão de sistemas:",patientOnAppointmentStore.revisaoSitemasController,4),
            generateFields("História médica pregressa:",patientOnAppointmentStore.historiaMedicaPregressaController,4),
            generateFields("História familiar:",patientOnAppointmentStore.historiaFamiliarController,4),
            generateFields("Perfil psicossocial:",patientOnAppointmentStore.perfilPsicossoialController,4),
          ],
        ),
      ),
    );
  }
}

Column generateFields(String title, TextEditingController controller, int lines){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
      const SizedBox(height: kSpacing,),
      TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: lines,
        cursorColor: Colors.black,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black)
          )
        ),
      ),
      const SizedBox(height: kSpacing,),
    ],
  );
}
