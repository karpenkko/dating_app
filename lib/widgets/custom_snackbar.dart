import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  final String text;
  final BuildContext context;

  CustomSnackBar({
    super.key,
    required this.text,
    required this.context,
  }) : super(
          content: Text(
            text,
            style: TextStyle(
              fontFamily: 'Raleway',
              color: Theme.of(context).scaffoldBackgroundColor,
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          padding: const EdgeInsets.all(20),
          backgroundColor: Theme.of(context).primaryColor,
          duration: const Duration(seconds: 3),
        );
}
