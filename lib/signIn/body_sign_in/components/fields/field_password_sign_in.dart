import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../store/signIn/sign_in_page_store.dart';

class FieldPasswordSignIn extends StatelessWidget {
  final SignInPageStore signInPageStore =  GetIt.I<SignInPageStore>();

  FieldPasswordSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
      ),
      child: TextField(
        cursorColor: Colors.red,
        focusNode: signInPageStore.passwordFocusNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        controller: signInPageStore.passwordController,
        obscureText: true,
        autofocus: false,
        onChanged: (value) {
          // setState(() {
          //   _isEditingPassword = true;
          // });
        },
        onSubmitted: (value) {
          signInPageStore.passwordFocusNode.unfocus();
          FocusScope.of(context)
              .requestFocus(signInPageStore.passwordFocusNode);
        },
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
            const BorderSide(color: Colors.red, width: 2),
          ),
          prefixIcon: const Icon(
            Icons.lock_sharp,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blueGrey[800]!,
              width: 3,
            ),
          ),
          filled: true,
          hintStyle: TextStyle(
            color: Colors.blueGrey[300],
          ),
          hintText: "Senha",
          fillColor: Colors.white,
          errorText: signInPageStore.isEditingPassword
              ? signInPageStore.validatePassword(signInPageStore.passwordController.text)
              : null,
          errorStyle: const TextStyle(
            fontSize: 12,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
