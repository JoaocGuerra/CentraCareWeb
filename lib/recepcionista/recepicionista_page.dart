import 'package:centralcareweb/components/responsive_builder.dart';
import 'package:centralcareweb/recepcionista/components/appointments/buildAppointments.dart';
import 'package:centralcareweb/recepcionista/components/new_date_doctor/details_date_doctor/details_date_doctor.dart';
import 'package:centralcareweb/recepcionista/components/side_bar/build_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../store/recepcionista_page/appointments_doctor/appointments_doctor_store.dart';
import '../store/recepcionista_page/show_home_store.dart';
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
  final ShowHomeStore showHomeStore =  GetIt.I<ShowHomeStore>();
  @override
  Widget build(BuildContext context) {
    appointmentsDoctorStore.fetchAppointmentsDoctors();
    return Observer(
        builder: (_){
          showHomeStore.showInHome;
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              showHomeStore.showInHome == 1 ? BuildNewAppointment() :
                              showHomeStore.showInHome == 2 ? DetailsAppointments() :
                              showHomeStore.showInHome == 3 ? RegisterPatient() :
                              showHomeStore.showInHome == 4 ? NewDateDoctor() :
                              showHomeStore.showInHome == 5 ? DetailsDateDoctor() : Center(),
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
                                child: showHomeStore.showInHome == 1 ? BuildNewAppointment() :
                                showHomeStore.showInHome == 2 ? DetailsAppointments() :
                                showHomeStore.showInHome == 3 ? RegisterPatient() :
                                showHomeStore.showInHome == 4 ? NewDateDoctor() :
                                showHomeStore.showInHome == 5 ? DetailsDateDoctor() : Center(),
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
                                child:  showHomeStore.showInHome == 1 ? BuildNewAppointment() :
                                showHomeStore.showInHome == 2 ? DetailsAppointments() :
                                showHomeStore.showInHome == 3 ? RegisterPatient() :
                                showHomeStore.showInHome == 4 ? NewDateDoctor() :
                                showHomeStore.showInHome == 5 ? DetailsDateDoctor() : Center(),
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
