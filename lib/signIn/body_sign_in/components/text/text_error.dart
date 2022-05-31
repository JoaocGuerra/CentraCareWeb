import 'package:flutter/material.dart';

import '../../../../components/custom_text.dart';

class TextError extends StatelessWidget {
  const TextError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomText(
      text: 'Credenciais incorretas',
      fontSize: 12,
      fontWeight: FontWeight.bold,
      corText: Colors.red,
    );
  }
}
