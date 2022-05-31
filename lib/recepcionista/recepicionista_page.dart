library recepcionista;

import 'package:centralcareweb/components/responsive_builder.dart';
import 'package:centralcareweb/recepcionista/components/appointments/buildAppointments.dart';
import 'package:centralcareweb/recepcionista/components/buildNewAppointment.dart';
import 'package:centralcareweb/recepcionista/components/buildSideBar.dart';
import 'package:flutter/material.dart';

import '../components/header_text.dart';
import '../constans/app_constants.dart';



class RecepicionistaPage extends StatefulWidget {
  const RecepicionistaPage({Key? key}) : super(key: key);

  @override
  _RecepicionistaPageState createState() => _RecepicionistaPageState();
}

class _RecepicionistaPageState extends State<RecepicionistaPage> {
  @override
  Widget build(BuildContext context) {
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
                      child: const BuildNewAppointment()
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
                    child: const BuildSideBar()
                  ),
                  Flexible(
                    flex: constraints.maxWidth > 1350 ? 10 : 9,
                    child: const BuildNewAppointment()
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
  }
}
