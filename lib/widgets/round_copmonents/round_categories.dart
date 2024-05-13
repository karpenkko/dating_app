import 'package:flutter/material.dart';

import '../../features/switching_themes/utils/colors.dart';

class RoundCategories extends StatelessWidget {
  final String hobby;

  const RoundCategories({
    super.key,
    required this.hobby,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColor.pinkColor,
          width: 1,
        ),
      ),
      child: Text(
        hobby,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.normal,
          fontSize: 16,
          height: 1.2,
        ),
      ),
    );
  }
}
