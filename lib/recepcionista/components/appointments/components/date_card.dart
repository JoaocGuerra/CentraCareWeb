import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  const DateCard({Key? key, required this.date}) : super(key: key);
  final String date;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(date),
          ],
        ),
      ],
    );
  }
}
