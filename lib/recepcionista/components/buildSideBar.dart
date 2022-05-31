import 'package:centralcareweb/signIn/signIn_page.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constans/app_constants.dart';

class BuildSideBar extends StatelessWidget {
  const BuildSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kSpacing),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Icon(EvaIcons.personOutline),
                    const SizedBox(width: 10,),
                    Column(
                      children: const [
                        Text("Nome da Pessoa"),
                        Text("Função"),
                      ],
                    )
                  ],
                )
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),

                  child: const Center(child: Text("Home"))
              ),
            ),
            const SizedBox(height: 20),

          ],
        ),
        const SizedBox(height: kSpacing),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:  Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const SignInPage()));
                  },
                  child: const Center(
                    child: Text(
                      "Sair",
                      style: TextStyle(
                          color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.all(kSpacing),
              child: Text(
                "2022 Central Care lisence",
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
      ],
    );
  }
}