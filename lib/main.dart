import 'package:dating_app/pages/start_pages/creating_profile_page.dart';
import 'package:dating_app/pages/start_pages/intro_page.dart';
import 'package:dating_app/pages/start_pages/login_page.dart';
import 'package:dating_app/pages/start_pages/signup_page.dart';
import 'package:dating_app/pages/home_pages/swipe_page.dart';
import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked : (didPop){},
      child: MaterialApp.router(
        title: 'Dator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}

