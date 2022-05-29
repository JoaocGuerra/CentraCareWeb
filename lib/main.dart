import 'package:centralcareweb/master/master_page.dart';
import 'package:centralcareweb/signIn/signIn_page.dart';
import 'package:centralcareweb/store/signIn/sign_in_page_store.dart';
import 'package:centralcareweb/store/tabs/register_tab/register_tab_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  setupLocators();
  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(RegisterTabStore());
  GetIt.I.registerSingleton(SignInPageStore());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
