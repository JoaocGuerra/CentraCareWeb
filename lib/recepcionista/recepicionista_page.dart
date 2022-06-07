library recepcionista;

import 'package:centralcareweb/components/responsive_builder.dart';
import 'package:centralcareweb/recepcionista/components/appointments/buildAppointments.dart';
import 'package:centralcareweb/recepcionista/components/appointments/new_appointments/buildNewAppointment.dart';
import 'package:centralcareweb/components/buildSideBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../store/recepcionista_page/appointments_doctor/appointments_doctor_store.dart';
import 'components/appointments/details_appointments/details_appointments.dart';

class RecepicionistaPage extends StatefulWidget {
  const RecepicionistaPage({Key? key}) : super(key: key);

  @override
  _RecepicionistaPageState createState() => _RecepicionistaPageState();
}

class _RecepicionistaPageState extends State<RecepicionistaPage> {
  final AppointmentsDoctorStore appointmentsDoctorStore =  GetIt.I<AppointmentsDoctorStore>();
  @override
  Widget build(BuildContext context) {
    appointmentsDoctorStore.fetchAppointmentsDoctors();
    return Observer(
        builder: (_){
          appointmentsDoctorStore.showDetailsAppointment;
          return Scaffold(
              drawer: ResponsiveBuilder.isDesktop(context)? null : Drawer(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: BuildSideBar(),
                  ),
                ),
              ),
              body: SafeArea(
                  child: ResponsiveBuilder(
                      mobileBuilder: (context, constraints){
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appointmentsDoctorStore.showDetailsAppointment ?
                              DetailsAppointments()
                                  :
                              BuildNewAppointment(),
                              BuildAppointments(),
                            ],
                          ),
                        );
                      },
                      tabletBuilder:(context, constraints){
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: constraints.maxWidth > 800 ? 8 : 7,
                              child: SingleChildScrollView(
                                controller: ScrollController(),
                                child: appointmentsDoctorStore.showDetailsAppointment ?
                                DetailsAppointments()
                                    :
                                BuildNewAppointment(),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: const VerticalDivider(),
                            ),
                            Flexible(
                              flex: 4,
                              child: SingleChildScrollView(
                                controller: ScrollController(),
                                child:BuildAppointments(),
                              ),
                            ),
                          ],
                        );
                      } ,
                      desktopBuilder: (context, constraints){
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                flex: constraints.maxWidth > 1350 ? 3 : 4,
                                child: BuildSideBar()
                            ),
                            Flexible(
                              flex: constraints.maxWidth > 1350 ? 10 : 9,
                              child: appointmentsDoctorStore.showDetailsAppointment ?
                              DetailsAppointments()
                                  :
                              BuildNewAppointment(),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: const VerticalDivider(),
                            ),
                            Flexible(
                                flex: 4,
                                child: BuildAppointments()
                            ),
                          ],
                        );
                      }
                  )
              )
          );
    });
  }
}
