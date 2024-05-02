import 'package:dating_app/pages/creating_profile_page.dart';
import 'package:dating_app/pages/intro_page.dart';
import 'package:dating_app/pages/login_page.dart';
import 'package:dating_app/pages/signup_page.dart';
import 'package:dating_app/pages/swipe_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SwipePage(),
    );
  }
}

