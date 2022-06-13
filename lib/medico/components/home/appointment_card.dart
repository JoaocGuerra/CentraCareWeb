import 'package:centralcareweb/repository/firebase_firestore/create_queue_attendance.dart';
import 'package:centralcareweb/store/auth/auth_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/details_date_doctor/details_date_doctor_store.dart';
import 'package:centralcareweb/utils/utils_datetime.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../repository/api/posicao_fila_repository.dart';
import '../../../store/medico_page/next_patients/next_patients_store.dart';
import '../../../store/show_pages/show_home_store.dart';

class AppointmentCard extends StatelessWidget {
  final ShowHomeStore showHomeStore = GetIt.I<ShowHomeStore>();
  final DetailsDateDoctorStore detailsDateDoctorStore = GetIt.I<DetailsDateDoctorStore>();
  final NextPatientsStore nextPatientsStore = GetIt.I<NextPatientsStore>();
  final AuthStore authStore = GetIt.I<AuthStore>();

  AppointmentCard({
    Key? key,
    required this.label,
    required this.dayMonthYear,
    required this.details,
  }) : super(key: key);

  final String label;
  final String dayMonthYear;
  final String details;
  final Color primary = Colors.blue;
  final Color onPrimary = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          child: InkWell(
            onTap: () {
              detailsDateDoctorStore.diaMesAno = dayMonthYear;
              detailsDateDoctorStore.codigoMedico = authStore.user?.uid ?? "";
              showHomeStore.setShowInHomeDoctor(3);
            },
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primary, primary.withOpacity(.7)],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                ),
              ),
              child: _BackgroundDecoration(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildLabel(),
                            const SizedBox(height: 20),
                            _buildDetails(),
                          ],
                        ),
                      ),
                      const Spacer(flex: 2),
                      Observer(builder: (_){
                        nextPatientsStore.attendanceStart;
                        return dayMonthYear == UtilsDateTime.getDatetimeNow() ?
                        _appointmentButton(nextPatientsStore.attendanceStart)
                            :
                        const SizedBox();
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel() {
    return Text(
      "Consultas " + label,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: onPrimary,
        letterSpacing: 1,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDetails() {
    return Container(
      decoration: BoxDecoration(
        color: onPrimary.withOpacity(.3),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        details,
        style: TextStyle(
          color: onPrimary,
          fontSize: 15,
          letterSpacing: 1,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _appointmentButton(bool attendanceStart) {
    return ElevatedButton.icon(
      onPressed: () async {
        showHomeStore.setShowInHomeDoctor(2);
        if(!attendanceStart){
          CreateQueueAttendanceRepository().createQueue(authStore.user?.uid ?? "", dayMonthYear);
          PosicaoFilaRepository().updatePatientAnswered(authStore.user?.uid ?? "", dayMonthYear, 0);
        }
      },
      style: ElevatedButton.styleFrom(
        primary: onPrimary,
        onPrimary: primary,
      ),
      icon: Icon(attendanceStart ? EvaIcons.refresh : EvaIcons.checkmarkCircle2Outline),
      label: Text(attendanceStart ? "Continuar Atendimentos" : "Iniciar Atendimentos"),
    );
  }
}

class _BackgroundDecoration extends StatelessWidget {
  const _BackgroundDecoration({required this.child, Key? key})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Transform.translate(
            offset: const Offset(25, -25),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white.withOpacity(.1),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Transform.translate(
            offset: const Offset(-70, 70),
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white.withOpacity(.1),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
