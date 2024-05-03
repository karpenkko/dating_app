import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../colors.dart';
import '../../widgets/login_button.dart';
import '../../widgets/login_field.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Column(
          children: [
            Expanded(child: Container(),),
            const Text(
              'Вхід',
              style: TextStyle(
                color: AppColor.blackColor,
                fontFamily: 'Raleway',
                fontSize: 34,
                height: 1.2,
              ),
            ),
            const Text(
              'ще не маєте аккаунту?',
              style: TextStyle(
                color: AppColor.blackColor,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w300,
                fontSize: 18,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 6, bottom: 8),
              decoration: BoxDecoration(
                color: AppColor.purpleColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'реєстрація',
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(child: Container(),),
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
            const SizedBox(height: 70),
            const LoginButton(buttonText: 'Вхід'),
            Expanded(child: Container(),),
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
    );
  }
}
