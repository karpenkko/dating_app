import 'package:flutter/material.dart';

import '../../colors.dart';

class RoundHobbies extends StatelessWidget {
  final String hobby;

  const RoundHobbies({
    super.key,
    required this.hobby,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColor.blackColor,
          width: 1,
        ),
      ),
      child: Text(
        hobby,
        style: const TextStyle(
          color: AppColor.blackColor,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.normal,
          fontSize: 16,
          height: 1.2,
        ),
      ),
    );
  }
}
