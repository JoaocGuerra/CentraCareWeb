import 'package:centralcareweb/store/api/horas_disponiveis_store.dart';
import 'package:centralcareweb/store/api/posicao_fila_store.dart';
import 'package:centralcareweb/store/auth/auth_store.dart';
import 'package:centralcareweb/store/master_page/tabs/employees_tab/employees_tab_store.dart';
import 'package:centralcareweb/store/master_page/tabs/register_tab/register_tab_store.dart';
import 'package:centralcareweb/store/medico_page/html_editor_store.dart';
import 'package:centralcareweb/store/medico_page/next_patients/next_patients_store.dart';
import 'package:centralcareweb/store/medico_page/query_doctor/query_doctor_store.dart';
import 'package:centralcareweb/store/recepcionista_page/appointments_doctor/appointments_doctor_store.dart';
import 'package:centralcareweb/store/recepcionista_page/appointments_doctor/details_appointments/details_appointments_doctor_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_appointment/date_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_appointment/doctors_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_appointment/especialidades_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_appointment/marcar_consulta_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_appointment/users_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/details_date_doctor/details_date_doctor_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/doctor_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/new_date_doctor_store.dart';
import 'package:centralcareweb/store/recepcionista_page/register_patient/register_patient_store.dart';
import 'package:centralcareweb/store/show_pages/show_home_store.dart';
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
  GetIt.I.registerSingleton(ShowHomeStore());

  GetIt.I.registerSingleton(RegisterTabStore());
  GetIt.I.registerSingleton(SignInPageStore());
  GetIt.I.registerSingleton(AuthStore());
  GetIt.I.registerSingleton(EmployeesTabStore());

  GetIt.I.registerSingleton(DetailsAppointmentsDoctorStore());
  GetIt.I.registerSingleton(DetailsDateDoctorStore());
  GetIt.I.registerSingleton(AppointmentsDoctorStore());

  GetIt.I.registerSingleton(HorasDisponiveisStore());
  GetIt.I.registerSingleton(PosicaoFilaStore());
  GetIt.I.registerSingleton(RegisterPatientStore());

  GetIt.I.registerSingleton(MarcarConsultaStore());
  GetIt.I.registerSingleton(EspecialidadesStore());
  GetIt.I.registerSingleton(DoctorsStoreNewAppointment());
  GetIt.I.registerSingleton(DateStore());
  GetIt.I.registerSingleton(UsersStore());

  GetIt.I.registerSingleton(NewDateDoctorStore());
  GetIt.I.registerSingleton(DoctorsStoreNewDate());

  GetIt.I.registerSingleton(HtmlEditorStore());
  GetIt.I.registerSingleton(NextPatientsStore());
  GetIt.I.registerSingleton(QueryDoctorStore());
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
