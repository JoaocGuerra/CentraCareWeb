import 'package:flutter/material.dart';

import '../../../../../../../constans/app_constants.dart';
import '../../../../../../../model/prontuario_model.dart';

class ProntuarioPatient extends StatelessWidget {
  final ProntruarioModel prontuario;
  const ProntuarioPatient({Key? key, required this.prontuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                bottom: const TabBar(
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(child: Text("Anamnese",style: TextStyle(color: Colors.black),),),
                    Tab(child: Text("Exame Físico",style: TextStyle(color: Colors.black),),),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  controller: ScrollController(initialScrollOffset: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      generateFields("Queixa principal:",prontuario.queixaPrincipal),
                      generateFields("História da doença atual:",prontuario.historiaDoencaAtual),
                      generateFields("Revisão de sistemas:",prontuario.revisaoDeSistemas),
                      generateFields("História médica pregressa:",prontuario.historiaMedicaPregressa),
                      generateFields("História familiar:",prontuario.historiaFamiliar),
                      generateFields("Perfil psicossocial:",prontuario.perfilPsicossocial),
                    ],
                  ),
                ),
                SingleChildScrollView(
                    controller: ScrollController(initialScrollOffset: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        generateFields("Sinais vitais:",prontuario.sinaisVitais),
                        generateFields("Avaliações:",prontuario.avaliacoes),
                      ],
                    )
                )
              ],
            )
        ),
      ),
    );
  }
}

Column generateFields(String title, String text){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
      const SizedBox(height: 10,),
      Wrap(
        children: [
          Text(text)
        ],
      ),
      const SizedBox(height: kSpacing,),
    ],
  );
}
