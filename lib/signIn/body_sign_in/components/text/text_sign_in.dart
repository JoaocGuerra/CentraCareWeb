import 'package:flutter/material.dart';

import '../../../../components/custom_text.dart';

class TextSignIn extends StatelessWidget {
  const TextSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomText(
      text: 'Central Care',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      corText: Colors.blueAccent,
    );
  }
}
