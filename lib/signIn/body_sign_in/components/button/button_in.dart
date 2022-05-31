import 'package:flutter/material.dart';
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
