import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../colors.dart';
import '../../widgets/login_button.dart';
import '../../widgets/login_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final checkPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    checkPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              const Text(
                'Рєєстрація',
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontFamily: 'Raleway',
                  fontSize: 34,
                  height: 1.2,
                ),
              ),
              const Text(
                'чи вже маєте аккаунт?',
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => context.go('/login/signup'),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 6, bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColor.purpleColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'вхід',
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              LoginField(
                controller: emailController,
                hintText: 'Пошта',
                length: 18.0,
              ),
              const SizedBox(height: 25),
              LoginField(
                controller: passwordController,
                hintText: 'Пароль',
                length: 18.0,
              ),
              const SizedBox(height: 25),
              LoginField(
                controller: checkPasswordController,
                hintText: 'Підтвердіть пароль',
                length: 18.0,
              ),
              const SizedBox(height: 60),
              LoginButton(
                buttonText: 'Зареєструватись',
                onPressed: () => context.go('/swipe'),
              ),
              Expanded(
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/logo.svg',
                    height: 25,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Dator',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontFamily: 'Raleway',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
