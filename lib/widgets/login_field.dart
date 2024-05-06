import 'package:flutter/material.dart';

import '../colors.dart';

class LoginField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double length;

  const LoginField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return //ConstrainedBox(
      // constraints: const BoxConstraints(
      //   maxWidth: 320,
      // ),
      /*child:*/ TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 25, top: length, bottom: length),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.blackColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.purpleColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColor.blackColor.withOpacity(0.8),
            fontWeight: FontWeight.normal,
          ),
        ),
        style: const TextStyle(
          fontFamily: 'Raleway',
          color: AppColor.blackColor,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
      //),
    );
  }
}
