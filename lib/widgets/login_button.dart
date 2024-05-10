import 'package:flutter/material.dart';

import '../features/switching_themes/utils/colors.dart';

class LoginButton extends StatefulWidget {
  final String buttonText;
  final Function()? onPressed;

  const LoginButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(320, 60),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          widget.buttonText,
          style: TextStyle(
            color: Theme.of(context).scaffoldBackgroundColor,
            fontFamily: 'Raleway',
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
