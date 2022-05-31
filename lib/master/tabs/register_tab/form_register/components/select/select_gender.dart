import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../store/register_tab_store.dart';

class SelectGender extends StatelessWidget {
  final RegisterTabStore registerTabStore =  GetIt.I<RegisterTabStore>();

  SelectGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder:(_){
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
                          registerTabStore.gender,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white.withOpacity(0.9)),
                        ),
                      ],
                    ),
                    PopupMenuButton<Gender>(
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                          size: 30,
                        ),

                        onSelected: (Gender item) {
                          registerTabStore.setGender(item.name);
                        },
                        itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<Gender>>[
                          const PopupMenuItem<Gender>(
                            value: Gender.MASCULINO,
                            child: Text('MASCULINO'),
                          ),
                          const PopupMenuItem<Gender>(
                            value: Gender.FEMININO,
                            child: Text('FEMININO'),
                          ),
                          const PopupMenuItem<Gender>(
                            value: Gender.OUTRO,
                            child: Text('OUTRO'),
                          ),
                        ])
                  ]),
            ),
          );
        }
    );
  }
}
