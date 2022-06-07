import 'package:centralcareweb/medico/components/next_patients.dart';
import 'package:centralcareweb/medico/components/on_appointment.dart';
import 'package:flutter/material.dart';

import '../components/responsive_builder.dart';
import '../recepcionista/components/buildSideBar.dart';

class MedicoPage extends StatefulWidget {
  const MedicoPage({Key? key}) : super(key: key);

  @override
  State<MedicoPage> createState() => _MedicoPageState();
}

class _MedicoPageState extends State<MedicoPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                        OnAppointmentCard(),
                        NextPatients()
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
                          child: OnAppointmentCard()
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
                          child:NextPatients(),
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
                        child: OnAppointmentCard(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: const VerticalDivider(),
                      ),
                      Flexible(
                          flex: 4,
                          child: NextPatients()
                      ),
                    ],
                  );
                }
            )
        )
    );
  }
}
