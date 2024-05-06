import 'package:flutter/material.dart';

import '../../colors.dart';

class BigButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  const BigButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        // width: 320,
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        decoration: BoxDecoration(
          color: AppColor.purpleColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: AppColor.whiteColor,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
            fontSize: 22,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
