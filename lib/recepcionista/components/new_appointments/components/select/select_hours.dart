import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:group_button/group_button.dart';

import '../../../../../store/api/horas_disponiveis_store.dart';
import '../../../../../store/recepcionista_page/new_appointment/marcar_consulta_store.dart';

class SelectHours extends StatelessWidget {
  final MarcarConsultaStore marcarConsultaStore = GetIt.I<MarcarConsultaStore>();
  final HorasDisponiveisStore horasDisponiveisStore = GetIt.I<HorasDisponiveisStore>();

  SelectHours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: marcarConsultaStore.maxWidth),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Selecione o horário",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 100,
                child: horasDisponiveisStore.loading ?
                const Center(
                  child: CircularProgressIndicator(),
                )
                    :
                GroupButton(
                  buttons: horasDisponiveisStore.dataHoursDoctor,
                  maxSelected: 1,
                  onSelected: (i, selected){
                    marcarConsultaStore.setSelectedHour(horasDisponiveisStore.dataHoursDoctor[i]);
                  },
                  options: GroupButtonOptions(
                    textAlign: TextAlign.center,
                    elevation: 2,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const Divider(height: 5),
            ],
          ),
        );
      },
    );
  }
}
