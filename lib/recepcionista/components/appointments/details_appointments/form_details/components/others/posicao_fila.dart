import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../store/api/posicao_fila_store.dart';
import '../../../../../../../store/recepcionista_page/appointments_doctor/details_appointments_doctor_store.dart';

class PosicaoFila extends StatelessWidget {
  final PosicaoFilaStore posicaoFilaStore = PosicaoFilaStore();
  final DetailsAppointmentsDoctorStore detailsAppointmentsDoctorStore =  GetIt.I<DetailsAppointmentsDoctorStore>();

  PosicaoFila({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    posicaoFilaStore.fetchPositionQueue(
        detailsAppointmentsDoctorStore.codigoMedico,
        detailsAppointmentsDoctorStore.diaMesAno,
        detailsAppointmentsDoctorStore.codigoPaciente);
    return Observer(
        builder: (_){
          return Column(
            children: [
              Text(
                  posicaoFilaStore.status == "fechado"
                      ? "Atendimento\nnão iniciado"
                      :
                  (posicaoFilaStore.status == "atendido"
                      ? ""
                      :
                  "Posição\nna fila"),
                  style: const TextStyle(
                      fontSize: 15)),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors
                      .blueAccent[100],
                  shape: BoxShape.circle,
                ),
                child: posicaoFilaStore.loading ?
                const Center(
                  child: CircularProgressIndicator(),
                )
                    :
                Center(
                    child: posicaoFilaStore.status ==
                        "fechado"
                        ? const Icon(
                      Icons.dangerous,
                      color: Colors
                          .white,
                    )
                        : (posicaoFilaStore.status ==
                        "atendido"
                        ? const Icon(
                      Icons.check,
                      color: Colors
                          .white,
                    )
                        : Text(
                      posicaoFilaStore.status,
                      style: const TextStyle(
                          fontWeight:
                          FontWeight
                              .bold,
                          fontSize:
                          20,
                          color: Colors
                              .white),
                    ))),
              )
            ],
          );
    });
  }
}
