import 'dart:core';

class DateDetailsModel{

  late String inicio, fim;
  late List<dynamic> horarios_indisponiveis, pacientes;
  late int intervalo;

  DateDetailsModel(
      this.inicio,
      this.fim,
      this.horarios_indisponiveis,
      this.intervalo,
      this.pacientes);
}