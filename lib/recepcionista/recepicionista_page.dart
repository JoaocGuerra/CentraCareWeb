library recepcionista;

import 'package:centralcareweb/components/responsive_builder.dart';
import 'package:centralcareweb/recepcionista/components/appointments/buildAppointments.dart';
import 'package:centralcareweb/recepcionista/components/new_date_doctor/details_date_doctor/details_date_doctor.dart';
import 'package:centralcareweb/recepcionista/components/side_bar/build_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../store/recepcionista_page/appointments_doctor/appointments_doctor_store.dart';
import '../store/show_pages/show_store.dart';
import 'components/appointments/details_appointments/details_appointments.dart';
import 'components/new_appointments/buildNewAppointment.dart';
import 'components/new_date_doctor/new_date_doctor.dart';
import 'components/register_patient/register_patient.dart';

class RecepicionistaPage extends StatefulWidget {
  const RecepicionistaPage({Key? key}) : super(key: key);

  @override
  _RecepicionistaPageState createState() => _RecepicionistaPageState();
}

class _RecepicionistaPageState extends State<RecepicionistaPage> {
  final AppointmentsDoctorStore appointmentsDoctorStore =  GetIt.I<AppointmentsDoctorStore>();
  final ShowStore showHomeStore =  GetIt.I<ShowStore>();
  @override
  Widget build(BuildContext context) {
    appointmentsDoctorStore.fetchAppointmentsDoctors();
    return Observer(
        builder: (_){
          showHomeStore.showInHomeReceptionist;
          return Scaffold(
              drawer: ResponsiveBuilder.isDesktop(context)? null : const Drawer(
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
                          controller: ScrollController(initialScrollOffset: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              showHomeStore.showInHomeReceptionist == 1 ? BuildNewAppointment() :
                              showHomeStore.showInHomeReceptionist == 2 ? DetailsAppointments() :
                              showHomeStore.showInHomeReceptionist == 3 ? RegisterPatient() :
                              showHomeStore.showInHomeReceptionist == 4 ? NewDateDoctor() :
                              showHomeStore.showInHomeReceptionist == 5 ? DetailsDateDoctor(recepcionista: true,) : Center(),
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
                                controller: ScrollController(initialScrollOffset: 0),
                                child: showHomeStore.showInHomeReceptionist == 1 ? BuildNewAppointment() :
                                showHomeStore.showInHomeReceptionist == 2 ? DetailsAppointments() :
                                showHomeStore.showInHomeReceptionist == 3 ? RegisterPatient() :
                                showHomeStore.showInHomeReceptionist == 4 ? NewDateDoctor() :
                                showHomeStore.showInHomeReceptionist == 5 ? DetailsDateDoctor(recepcionista: true,) : Center(),
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
                              child:SingleChildScrollView(
                                child:  showHomeStore.showInHomeReceptionist == 1 ? BuildNewAppointment() :
                                showHomeStore.showInHomeReceptionist == 2 ? DetailsAppointments() :
                                showHomeStore.showInHomeReceptionist == 3 ? RegisterPatient() :
                                showHomeStore.showInHomeReceptionist == 4 ? NewDateDoctor() :
                                showHomeStore.showInHomeReceptionist == 5 ? DetailsDateDoctor(recepcionista: true,) : Center(),
                                controller: ScrollController(initialScrollOffset: 0),
                              ),
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
