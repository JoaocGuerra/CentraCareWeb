import 'package:centralcareweb/master/master_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../store/signIn/sign_in_page_store.dart';

class ButtonIn extends StatelessWidget {
  final SignInPageStore signInPageStore =  GetIt.I<SignInPageStore>();

  ButtonIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 1,
            child: SizedBox(
              width: double.maxFinite,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(
                        Colors.blueAccent),
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(18.0),
                        ))),
                onPressed: () async {
                  await signInPageStore.validateLogin();
                  // setState(() {
                  //   _isLoggingIn = true;
                  //   textFocusNodeEmail.unfocus();
                  //   textFocusNodePassword.unfocus();
                  // });
                  // setState(() {
                  //   _isLoggingIn = false;
                  //   textControllerEmail.text = '';
                  //   textControllerPassword.text = '';
                  //   _isEditingEmail = false;
                  //   _isEditingPassword = false;
                  // });
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 15.0,
                    bottom: 15.0,
                  ),
                  child:Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
