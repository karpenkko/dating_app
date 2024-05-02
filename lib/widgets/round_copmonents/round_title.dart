import 'package:flutter/material.dart';

import '../../colors.dart';

class RoundTitle extends StatelessWidget {
  final String titleText;

  const RoundTitle({
    super.key,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 40, right: 40, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: AppColor.greenColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        titleText,
        style: const TextStyle(
          color: AppColor.blackColor,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }
}
