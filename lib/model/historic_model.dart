import 'dart:core';

import 'package:centralcareweb/model/prontuario_model.dart';

class HistoricModel{

  late String nomeMedico, diaMesAno, especialidade, receita;
  late ProntruarioModel prontruarioModel;

  HistoricModel(
      this.nomeMedico,
      this.diaMesAno,
      this.especialidade,
      this.receita,
      this.prontruarioModel);
}