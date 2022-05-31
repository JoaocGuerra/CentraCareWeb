import 'package:centralcareweb/master/master_page.dart';
import 'package:centralcareweb/signIn/body_sign_in/components/button/button_in.dart';
import 'package:centralcareweb/signIn/body_sign_in/components/fields/field_email_sign_in.dart';
import 'package:centralcareweb/signIn/body_sign_in/components/fields/field_password_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../store/signIn/sign_in_page_store.dart';
import 'components/text/text_error.dart';
import 'components/text/text_sign_in.dart';

class BodySignIn extends StatelessWidget {
  final SignInPageStore signInPageStore =  GetIt.I<SignInPageStore>();

  BodySignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder:(_){
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            alignment: Alignment.center,
            width: 325,
            height: 325,
            child: signInPageStore.login?
            const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
                valueColor:
                AlwaysStoppedAnimation<Color>(
                    Colors.white),
              ),
            )
                :
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: TextSignIn(),
                ),
                const SizedBox(height: 30),

                FieldEmailSignIn(),
                const SizedBox(height: 20),

                FieldPasswordSignIn(),

                ButtonIn(),

                Center(
                  child: signInPageStore.errorLogin ? TextError() : Text("")
                )
              ],
            ),
          );
        }
    );
  }
}
