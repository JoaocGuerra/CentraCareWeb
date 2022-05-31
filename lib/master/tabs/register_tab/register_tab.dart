import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'form_register/form_register.dart';

class RegisterTab extends StatelessWidget {

  const RegisterTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(50.0),
                child: Observer(builder: (_) {
                  return FormRegister();
                })),
          ),
        ),
      ),
    );
  }
}

