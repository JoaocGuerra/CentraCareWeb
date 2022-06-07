import 'package:flutter/material.dart';
import '../../../constans/app_constants.dart';

class NextPatientCard extends StatelessWidget {

  const NextPatientCard({
    required this.name,
    this.dividerColor,
    Key? key,
  }) : super(key: key);

  final String name;
  final Color? dividerColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: Padding(
        padding: const EdgeInsets.all(kSpacing / 2),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpacing),
              child: _buildDivider(),
            ),
            Expanded(
              child: _buildSubtitle(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 3,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        gradient: LinearGradient(
          colors: [
            dividerColor ?? Colors.blueAccent,
            dividerColor?.withOpacity(.6) ?? Colors.blueAccent.withOpacity(.6),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }


  Widget _buildSubtitle() {
    return Text(
      name,
      maxLines: 1,
      style: const TextStyle(fontWeight: FontWeight.w600),
      overflow: TextOverflow.ellipsis,
    );
  }
}
