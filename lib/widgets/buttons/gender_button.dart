import 'package:flutter/material.dart';

import '../../colors.dart';

class GenderButton extends StatelessWidget {
  final String? selectedGender;
  final String gender;
  final String buttonText;
  final VoidCallback onTap;


  const GenderButton({
    super.key,
    required this.selectedGender,
    required this.gender,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          // width: 320,
          padding:
          const EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: selectedGender == gender
                ? AppColor.pinkColor
                : null,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selectedGender == gender
                  ? AppColor.pinkColor
                  : AppColor.blackColor.withOpacity(0.7),
              width: 1,
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              color: selectedGender == gender
                  ? AppColor.whiteColor
                  : AppColor.blackColor.withOpacity(0.8),
              fontFamily: 'Raleway',
              fontWeight: FontWeight.normal,
              fontSize: 16,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
