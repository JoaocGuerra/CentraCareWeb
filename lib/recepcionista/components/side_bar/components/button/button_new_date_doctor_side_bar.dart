import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../store/show_pages/show_home_store.dart';

class ButtonNewDateDoctorSideBar extends StatelessWidget {
  final ShowHomeStore showHomeStore =  GetIt.I<ShowHomeStore>();

  ButtonNewDateDoctorSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),

          child: Center(
              child: TextButton(
                  onPressed: (){
                    showHomeStore.setShowInHomeReceptionist(4);
                  },
                  child: const Text("Criar/Atualizar atendimento médico")
              )
          )
      ),
    );
  }
}