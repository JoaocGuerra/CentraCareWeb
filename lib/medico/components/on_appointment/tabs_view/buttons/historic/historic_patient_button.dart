import 'package:centralcareweb/medico/components/on_appointment/tabs_view/buttons/historic/prontuario/prontuario_patient.dart';
import 'package:centralcareweb/store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:get_it/get_it.dart';
import '../../../../../../model/prontuario_model.dart';
import '../../../../../../store/medico_page/next_patients/next_patients_store.dart';

class HistoricPatientButton extends StatelessWidget {
  final NextPatientsStore nextPatientsStore = GetIt.I<NextPatientsStore>();
  final PatientOnAppointmentStore patientOnAppointmentStore = GetIt.I<PatientOnAppointmentStore>();

  HistoricPatientButton({Key? key}) : super(key: key);

  showChart(BuildContext context,ProntruarioModel prontruario) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Prontuario"),
          content: ProntuarioPatient(prontuario: prontruario,),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text("Fechar")),
          ],
        );
      },
    );
  }

  showRecipe(BuildContext context, String receita) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 600,
            child: HtmlWidget(
              '<iframe src='+receita+'></iframe>',
              factoryBuilder: () => MyWidgetFactory(),
            ),
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text("Fechar")),
          ],
        );
      },
    );
  }

  showAlertHistoric(BuildContext context){
    patientOnAppointmentStore.fetchHistoricPatient();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Observer(builder: (_){
          return AlertDialog(
            title: const Text("Histórico de consultas"),
            content: SizedBox(
              height: 175,
              width: 360,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: patientOnAppointmentStore.listHistoric.length,
                itemBuilder: (context, i) {
                  String nomeMedico = patientOnAppointmentStore.listHistoric[i].nomeMedico;
                  String especialidade = patientOnAppointmentStore.listHistoric[i].especialidade;
                  String diaMesAno = patientOnAppointmentStore.listHistoric[i].diaMesAno;
                  String receita = patientOnAppointmentStore.listHistoric[i].receita;
                  ProntruarioModel prontuario = patientOnAppointmentStore.listHistoric[i].prontruarioModel;

                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(diaMesAno+" - "+nomeMedico+" - "+especialidade),
                          const SizedBox(width: 20,),
                          TextButton(
                            onPressed: (){
                              showChart(context,prontuario);
                            },
                            child: const Text("Prontuário"),
                          ),
                          TextButton(
                            onPressed: (){
                              showRecipe(context,receita);
                            },
                            child: const Text("Receita"),
                          ),
                        ],
                      ),
                      const Divider()
                    ],
                  );
                },
              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("Fechar")),
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 375,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12)),
        child: TextButton(
          onPressed: (){
            showAlertHistoric(context);
          },
          child: const Center(
            child: Text(
              "Histórico de consultas",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}