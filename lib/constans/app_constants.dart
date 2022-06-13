library app_constants;

import 'package:flutter/material.dart';

const kFontColorPallets = [
  Color.fromRGBO(26, 31, 56, 1),
  Color.fromRGBO(72, 76, 99, 1),
  Color.fromRGBO(149, 149, 163, 1),
];
const kBorderRadius = 10.0;
const kSpacing = 20.0;
const maxWidthBoxConstrains = 600.0;

const String pathLocal = "http://192.168.0.5:5000";
const String pathInsertQueue = "/fila/inserir";
const String pathUpdateQueue = "/fila/update";
const String pathReadPositionQueue = "/fila/read";
const String pathDeselectQuery = "/fila/delete";
const String pathAvailableTimes = "/horarios-disponiveis-medico";
const String pathReadPositionQueueAppointment = "/atendimento/read";
const String pathInsertAppointment = "/atendimento/inserir";
const String pathUpdatePatientAnswered = "/atendimento/update/paciente-atendido";
