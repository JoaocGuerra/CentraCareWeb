import 'package:centralcareweb/store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:get_it/get_it.dart';
import '../../../../store/medico_page/next_patients/next_patients_store.dart';

class HistoricPatientButton extends StatelessWidget {
  final NextPatientsStore nextPatientsStore = GetIt.I<NextPatientsStore>();
  final PatientOnAppointmentStore patientOnAppointmentStore = GetIt.I<PatientOnAppointmentStore>();

  HistoricPatientButton({Key? key}) : super(key: key);

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
          return Stack(
            children: [
              Positioned(
                  top: 50,
                  left: 500,
                  child: AlertDialog(
                    title: const Text("Histórico de consultas"),
                    content: SizedBox(
                      height: 175,
                      width: 300.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: patientOnAppointmentStore.listHistoric.length,
                        itemBuilder: (context, i) {
                          String nomeMedico = patientOnAppointmentStore.listHistoric[i].nomeMedico;
                          String especialidade = patientOnAppointmentStore.listHistoric[i].especialidade;
                          String diaMesAno = patientOnAppointmentStore.listHistoric[i].diaMesAno;
                          String receita = patientOnAppointmentStore.listHistoric[i].receita;

                          return ListTile(
                            title: Text(diaMesAno+" - "+nomeMedico+" - "+especialidade),
                            onTap: (){
                              showRecipe(context,receita);
                            },
                          );
                        },
                      ),
                    ),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: const Text("Fechar")),
                    ],
                  )
              )
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