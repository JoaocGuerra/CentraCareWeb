import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../store/tabs/register_tab/register_tab_store.dart';

class ButtonRegister extends StatelessWidget {
  final RegisterTabStore registerTabStore =  GetIt.I<RegisterTabStore>();

  ButtonRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: registerTabStore.maxWidthBoxConstrains),
      child: Container(
        height: 50,
        width: 300 ,
        decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.7),
            borderRadius: BorderRadius.circular(25)),
        child: TextButton(
          onPressed: () {},
          child: const Center(
            child: Text(
              "Clique aqui",
              style: TextStyle(
                  color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
