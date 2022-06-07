import 'package:centralcareweb/components/responsive_builder.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../components/header_text.dart';
import '../../constans/app_constants.dart';

class OnAppointmentCard extends StatelessWidget {
  const OnAppointmentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kSpacing),
            Row(
              children: const [
                Expanded(child: HeaderText("Em Atendimento")),
                Icon(
                  EvaIcons.calendarOutline,
                )
              ],
            ),
            SizedBox(height: _isMobile(context)? kSpacing : 200,),
            Center(
              child: Container(
                height: 400,
                width: 600,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _isMobile(context){
    if(ResponsiveBuilder.isMobile(context)) return true;
    return false;
  }
}
