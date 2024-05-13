import 'package:flutter/material.dart';

import '../../features/switching_themes/utils/colors.dart';

class LoginField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double length;
  final bool obscureText;

  const LoginField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.length,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 25, top: length, bottom: length),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
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
          color: Theme.of(context).primaryColor.withOpacity(0.8),
          fontWeight: FontWeight.normal,
        ),
      ),
      style: TextStyle(
        fontFamily: 'Raleway',
        color: Theme.of(context).primaryColor,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
