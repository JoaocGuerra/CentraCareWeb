import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../store/master_page/tabs/register_tab/register_tab_store.dart';


class SelectFunction extends StatelessWidget {
  final RegisterTabStore registerTabStore =  GetIt.I<RegisterTabStore>();

  SelectFunction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: registerTabStore.maxWidthBoxConstrains),
          child: Container(
            padding:
            const EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.7),
                borderRadius: BorderRadius.circular(90)),
            height: 51,
            child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        registerTabStore.function,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white.withOpacity(0.9)),
                      ),
                    ],
                  ),
                  PopupMenuButton<Function>(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 30,
                      ),

                      onSelected: (Function item) {
                        registerTabStore.setFunction(item.name);
                      },
                      itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<Function>>[
                        const PopupMenuItem<Function>(
                          value: Function.RECEPCIONISTA,
                          child: Text('RECEPCIONISTA'),
                        ),
                        const PopupMenuItem<Function>(
                          value: Function.MEDICO,
                          child: Text('MÉDICO'),
                        ),
                      ])
                ]),
          ),
        );
      },
    );
  }
}
