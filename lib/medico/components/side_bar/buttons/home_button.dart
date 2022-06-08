import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../store/show_pages/show_home_store.dart';

class HomeButton extends StatelessWidget {
  final ShowHomeStore showHomeStore =  GetIt.I<ShowHomeStore>();

  HomeButton({Key? key}) : super(key: key);

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
            showHomeStore.setShowInHomeDoctor(1);
          },
          child: const Center(
            child: Text(
              "Início",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
