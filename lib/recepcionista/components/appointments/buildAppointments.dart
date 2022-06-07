import 'package:centralcareweb/store/recepcionista_page/appointments_doctor/appointments_doctor_store.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../components/header_text.dart';
import '../../../constans/app_constants.dart';

class BuildAppointments extends StatelessWidget {

  final AppointmentsDoctorStore appointmentsDoctorStore =  GetIt.I<AppointmentsDoctorStore>();
  BuildAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kSpacing),
                Row(
                  children: const [
                    Expanded(child: HeaderText("Consultas")),
                    Icon(
                      EvaIcons.calendarOutline,
                    )
                  ],
                ),
                const SizedBox(height: kSpacing,),
                appointmentsDoctorStore.loading?
                const Center(
                  child: CircularProgressIndicator(),
                )
                    :
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: appointmentsDoctorStore.doctorNames.length,
                      itemBuilder: (context,i){
                        String nameDoctor = appointmentsDoctorStore.doctorNames[i];
                        return Column(
                          children: [
                            TreeView(
                              indent: 5,
                              treeController: TreeController(
                                allNodesExpanded: false,
                              ),
                              nodes: [
                                TreeNode(
                                    content: Text(nameDoctor),
                                    children: appointmentsDoctorStore.dataAppointments[nameDoctor]
                                )
                              ],
                            ),
                            Divider()
                          ],
                        );
                      },
                    )
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
