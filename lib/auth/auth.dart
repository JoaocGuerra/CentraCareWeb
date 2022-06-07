import 'package:centralcareweb/master/master_page.dart';
import 'package:centralcareweb/medico/medico_page.dart';
import 'package:centralcareweb/recepcionista/recepicionista_page.dart';
import 'package:centralcareweb/signIn/signIn_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../store/auth/auth_store.dart';

class Auth extends StatelessWidget {
  final AuthStore authStore =  GetIt.I<AuthStore>();

  Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authStore.fetchUser();
    return Scaffold(
      body: Observer(
        builder: (_) {
          if(authStore.hasUser){
            if(authStore.function == "admin") return const MasterPage();
            if(authStore.function == "medico") return const MedicoPage();
            if(authStore.function == "recepcionista") return const RecepicionistaPage();
          }
          return SignInPage();
        },
      ),
    );
  }
}