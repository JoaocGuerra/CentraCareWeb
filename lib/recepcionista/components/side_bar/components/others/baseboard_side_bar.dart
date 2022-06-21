import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../constans/app_constants.dart';
import '../../../../../store/auth/auth_store.dart';

class BaseboardSideBar extends StatelessWidget {
  final AuthStore authStore =  GetIt.I<AuthStore>();
  BaseboardSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:  Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12)),
              child: TextButton(
                onPressed: () {
                  authStore.userSignOut();
                },
                child: const Center(
                  child: Text(
                    "Sair",
                    style: TextStyle(
                        color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            )
        ),
        Padding(
          padding: EdgeInsets.all(kSpacing),
          child: Text(
            "2022 Central Care Licence",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}
