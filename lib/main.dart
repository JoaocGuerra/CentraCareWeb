import 'package:centralcareweb/master/master_page.dart';
import 'package:centralcareweb/recepcionista/recepicionista_page.dart';
import 'package:centralcareweb/store/api/horas_disponiveis_store.dart';
import 'package:centralcareweb/store/api/posicao_fila_store.dart';
import 'package:centralcareweb/store/auth/auth_store.dart';
import 'package:centralcareweb/store/master_page/tabs/employees_tab/employees_tab_store.dart';
import 'package:centralcareweb/store/master_page/tabs/register_tab/register_tab_store.dart';
import 'package:centralcareweb/store/recepcionista_page/appointments_doctor/appointments_doctor_store.dart';
import 'package:centralcareweb/store/recepcionista_page/appointments_doctor/details_appointments/details_appointments_doctor_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_appointment/date_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_appointment/doctors_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_appointment/especialidades_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_appointment/marcar_consulta_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_appointment/users_store.dart';
import 'package:centralcareweb/store/recepcionista_page/register_patient/register_patient_store.dart';
import 'package:centralcareweb/store/recepcionista_page/show_home_store.dart';
import 'package:centralcareweb/store/signIn/sign_in_page_store.dart';
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

  GetIt.I.registerSingleton(ShowHomeStore());
  GetIt.I.registerSingleton(DetailsAppointmentsDoctorStore());
  GetIt.I.registerSingleton(AppointmentsDoctorStore());

  GetIt.I.registerSingleton(HorasDisponiveisStore());
  GetIt.I.registerSingleton(PosicaoFilaStore());
  GetIt.I.registerSingleton(RegisterPatientStore());

  GetIt.I.registerSingleton(MarcarConsultaStore());
  GetIt.I.registerSingleton(EspecialidadesStore());
  GetIt.I.registerSingleton(DoctorsStore());
  GetIt.I.registerSingleton(DateStore());
  GetIt.I.registerSingleton(UsersStore());
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
