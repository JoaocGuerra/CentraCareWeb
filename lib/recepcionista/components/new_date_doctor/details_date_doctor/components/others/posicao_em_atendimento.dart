import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/details_date_doctor/details_date_doctor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../store/api/posicao_fila_store.dart';

class PosicaoEmAtendimento extends StatelessWidget {
  final PosicaoFilaStore posicaoFilaStore = PosicaoFilaStore();
  final DetailsDateDoctorStore detailsDateDoctorStore =  GetIt.I<DetailsDateDoctorStore>();

  PosicaoEmAtendimento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    posicaoFilaStore.fetchPositionInAttendance(
        detailsDateDoctorStore.codigoMedico,
        detailsDateDoctorStore.diaMesAno
    );
    return Observer(
        builder: (_){
          return Column(
            children: [
              Text(
                  posicaoFilaStore.statusInAttendance == "" ?
                  ""
                    :
                  (posicaoFilaStore.statusInAttendance == "fechado" ?
                  "Atendimento\nnão iniciado"
                      :
                  "Posição\nem atendimento"),
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
                    child: posicaoFilaStore.statusInAttendance == "fechado" ?
                    const Icon(
                      Icons.dangerous,
                      color: Colors
                          .white,
                    )
                        :
                    Text(
                      posicaoFilaStore.statusInAttendance,
                      style: const TextStyle(
                          fontWeight:
                          FontWeight
                              .bold,
                          fontSize:
                          20,
                          color: Colors
                              .white),
                    )
                ),
              )
            ],
          );
    });
  }
}
