import 'dart:core';

class ProntruarioModel{

  late String queixaPrincipal, historiaDoencaAtual, revisaoDeSistemas, historiaMedicaPregressa, historiaFamiliar, perfilPsicossocial;
  late String sinaisVitais, avaliacoes;

  ProntruarioModel(
      this.queixaPrincipal,
      this.historiaDoencaAtual,
      this.revisaoDeSistemas,
      this.historiaMedicaPregressa,
      this.historiaFamiliar,
      this.perfilPsicossocial,
      this.sinaisVitais,
      this.avaliacoes);
}