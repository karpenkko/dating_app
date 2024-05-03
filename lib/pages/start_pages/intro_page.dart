import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../colors.dart';
import '../../widgets/buttons/big_button.dart';
import 'package:go_router/go_router.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
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
            const SizedBox(height: 30),
            BigButton(
              buttonText: 'Розпочати',
              onTap: () {
                context.push('/swipe');
              },
            ),
          ],
        ),

      ),
    );
  }
}
