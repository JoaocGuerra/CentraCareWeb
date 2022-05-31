import 'package:centralcareweb/signIn/body_sign_in/body_sign_in.dart';
import 'package:flutter/material.dart';


class SignInPage extends StatelessWidget {
  static const routeName = '/auth';
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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

}
