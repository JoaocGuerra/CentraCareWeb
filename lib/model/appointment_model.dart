import 'dart:core';

class AppointmentModel{

  late String codigoMedico, codigoPaciente, diaMesAno;
  late String nomeMedico, especialidadeMedico;
  late String inicioConsulta, terminoConsulta;
  late String status;
  late String receita;

  AppointmentModel(
      this.codigoMedico,
      this.codigoPaciente,
      this.diaMesAno,
      this.nomeMedico,
      this.especialidadeMedico,
      this.inicioConsulta,
      this.terminoConsulta,
      this.status,
      this.receita);
}