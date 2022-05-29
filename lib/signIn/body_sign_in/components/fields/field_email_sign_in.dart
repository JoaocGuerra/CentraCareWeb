import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../store/signIn/sign_in_page_store.dart';

class FieldEmailSignIn extends StatelessWidget {
  final SignInPageStore signInPageStore =  GetIt.I<SignInPageStore>();

  FieldEmailSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
      ),
      child: TextField(
        cursorColor: Colors.red,
        focusNode: signInPageStore.emailFocusNode,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        controller: signInPageStore.emailController,
        autofocus: false,
        onChanged: (value) {
          signInPageStore.isEditingEmail = true;
        },
        onSubmitted: (value) {
          signInPageStore.emailFocusNode.unfocus();
          FocusScope.of(context)
              .requestFocus(signInPageStore.passwordFocusNode);
        },
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email,
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
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
            const BorderSide(color: Colors.red, width: 2),
          ),
          hintText: "Email",
          fillColor: Colors.white,
          errorText: signInPageStore.isEditingEmail
              ? signInPageStore.validateEmail(signInPageStore.emailController.text)
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
