import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../store/show_pages/show_store.dart';

class GoAppointmentButton extends StatelessWidget {
  final ShowStore showHomeStore =  GetIt.I<ShowStore>();

  GoAppointmentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          onPressed: () {
            showHomeStore.setShowInHomeDoctor(2);
          },
          child: const Center(
            child: Text(
              "Atendimentos",
            ),
          ),
        ),
      ),
    );
  }
}
