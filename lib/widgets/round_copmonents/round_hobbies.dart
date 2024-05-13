import 'package:flutter/material.dart';

import '../../features/switching_themes/utils/colors.dart';

class RoundHobbies extends StatelessWidget {
  final String hobby;
  final bool isSelected;
  final VoidCallback onTap;

  const RoundHobbies({
    super.key,
    required this.hobby,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor.pinkColor
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppColor.pinkColor
                : Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
        child: Text(
          hobby,
          style: TextStyle(
            color: isSelected
                ? AppColor.whiteColor
                : Theme.of(context).primaryColor,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.normal,
            fontSize: 16,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
