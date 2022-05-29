import 'package:centralcareweb/master/master_page.dart';
import 'package:centralcareweb/signIn/body_sign_in/body_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../components/custom_text.dart';
import '../store/signIn/sign_in_page_store.dart';

class SignInPage extends StatelessWidget {
  static const routeName = '/auth';
  final SignInPageStore signInPageStore =  GetIt.I<SignInPageStore>();

  SignInPage({Key? key}) : super(key: key);

  void showSnackBar(BuildContext context){
    const snackBar = SnackBar(
      content: CustomText(
          text:
          'Preencha os dados da forma correta.'),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {

    return Observer(
        builder:(_){
          return signInPageStore.masterPage ?
          const MasterPage()
              :
          Scaffold(
              backgroundColor: Colors.blueAccent,
              body: Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  children:[
                    Center(
                      child: BodySignIn(),
                    ),
                  ],
                ),
              )
          );
        }
    );
  }

}
