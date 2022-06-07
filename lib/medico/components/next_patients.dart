import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../components/header_text.dart';
import '../../constans/app_constants.dart';

class NextPatients extends StatelessWidget {
  const NextPatients({Key? key}) : super(key: key);

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
                Expanded(child: HeaderText("Próximos Pacientes")),
                Icon(
                  EvaIcons.calendarOutline,
                )
              ],
            ),
            const SizedBox(height: kSpacing,),
            HeaderText("João"),
            HeaderText("João"),
            HeaderText("João"),
            HeaderText("João"),

          ],
        ),
      ),
    );
  }
}
