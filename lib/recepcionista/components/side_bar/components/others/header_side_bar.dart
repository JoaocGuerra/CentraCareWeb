import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../store/auth/auth_store.dart';

class HeaderReceptionistSideBar extends StatelessWidget {
  final AuthStore authStore =  GetIt.I<AuthStore>();

  HeaderReceptionistSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                const Icon(EvaIcons.personOutline),
                const SizedBox(width: 10,),
                Column(
                  children:[
                    Text(authStore.name),
                    Text(authStore.function),
                  ],
                )
              ],
            )
        ),
      ],
    );
  }
}
