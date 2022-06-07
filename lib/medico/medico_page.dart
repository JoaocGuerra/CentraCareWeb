import 'package:centralcareweb/medico/components/next_patient/build_next_patients.dart';
import 'package:centralcareweb/medico/components/on_appointment/build_on_appointment.dart';
import 'package:flutter/material.dart';

import '../components/responsive_builder.dart';
import '../recepcionista/components/side_bar/build_side_bar.dart';
import 'components/side_bar/build_side_bar_doctor.dart';

class MedicoPage extends StatefulWidget {
  const MedicoPage({Key? key}) : super(key: key);

  @override
  State<MedicoPage> createState() => _MedicoPageState();
}

class _MedicoPageState extends State<MedicoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ResponsiveBuilder.isDesktop(context)
            ? null
            : Drawer(
                child: SafeArea(
                  child: SingleChildScrollView(
                    controller: ScrollController(initialScrollOffset: 0),
                    child: BuildSideBarDoctor(),
                  ),
                ),
              ),
        body: SafeArea(
            child: ResponsiveBuilder(mobileBuilder: (context, constraints) {
          return SingleChildScrollView(
            controller: ScrollController(initialScrollOffset: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildOnAppointmentCard(),
                BuildNextPatients()
              ],
            ),
          );
        }, tabletBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: constraints.maxWidth > 800 ? 8 : 7,
                child: SingleChildScrollView(
                    controller: ScrollController(initialScrollOffset: 0),
                    child: BuildOnAppointmentCard()),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const VerticalDivider(),
              ),
              Flexible(
                flex: 4,
                child: SingleChildScrollView(
                  controller: ScrollController(initialScrollOffset: 0),
                  child: const BuildNextPatients(),
                ),
              ),
            ],
          );
        }, desktopBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: constraints.maxWidth > 1350 ? 3 : 4,
                  child: BuildSideBarDoctor()),
              Flexible(
                flex: constraints.maxWidth > 1350 ? 10 : 9,
                child: BuildOnAppointmentCard(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const VerticalDivider(),
              ),
              const Flexible(flex: 4, child: BuildNextPatients()),
            ],
          );
        })));
  }
}
