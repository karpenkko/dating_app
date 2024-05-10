import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/switching_themes/utils/colors.dart';

class RoundSwipeButton extends StatelessWidget {
  final String path;
  final double horizontal;

  const RoundSwipeButton({
    super.key,
    required this.path,
    required this.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColor.greenColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: horizontal),
          decoration: BoxDecoration(
            color: AppColor.greenColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: SvgPicture.asset(
            path,
            colorFilter:
                const ColorFilter.mode(AppColor.blackColor, BlendMode.srcIn),
            height: 10,
          ),
        ),
      ],
    );
  }
}
