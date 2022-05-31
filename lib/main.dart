import 'package:centralcareweb/master/master_page.dart';
import 'package:centralcareweb/signIn/signIn_page.dart';
import 'package:centralcareweb/store/auth/auth_store.dart';
import 'package:centralcareweb/store/signIn/sign_in_page_store.dart';
import 'package:centralcareweb/store/tabs/employees_tab/employees_tab_store.dart';
import 'package:centralcareweb/store/tabs/register_tab/register_tab_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'auth/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocators();
  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(RegisterTabStore());
  GetIt.I.registerSingleton(SignInPageStore());
  GetIt.I.registerSingleton(AuthStore());
  GetIt.I.registerSingleton(EmployeesTabStore());
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
      home: Auth(),
      );
  }
}
