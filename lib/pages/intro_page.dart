import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/logo.svg',
              height: 52,
            ),
            const SizedBox(width: 16),
            const Text(
              'Dator',
              style: TextStyle(
                color: AppColor.blackColor,
                fontFamily: 'Raleway',
                fontSize: 44,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
