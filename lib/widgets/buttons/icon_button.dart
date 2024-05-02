import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../colors.dart';

class RoundIconButton extends StatelessWidget {
  final String path;

  const RoundIconButton({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: AppColor.pinkColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: SvgPicture.asset(
        path,
        colorFilter: const ColorFilter.mode(AppColor.whiteColor, BlendMode.srcIn),
        height: 14,
      ),
    );
  }
}
