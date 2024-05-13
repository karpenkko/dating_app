import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/login_elements/login_field.dart';
import '../../switching_themes/utils/colors.dart';
import '../../../widgets/login_elements/login_button.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginErrorState) {
              final snackBar = CustomSnackBar(
                context: context,
                text: state.error,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (state is LoginLoadedState) {
              context.go('/swipe');
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Вхід',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Raleway',
                          fontSize: 34,
                          height: 1.2,
                        ),
                      ),
                      Text(
                        'ще не маєте аккаунту?',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => context.go('/signup'),
                        child: Container(
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
                      ),
                    ],
                  ),
                  Column(
                    children: [
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
                        obscureText: true,
                      ),
                      const SizedBox(height: 60),
                      LoginButton(
                        buttonText: 'Вхід',
                        onPressed: () {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            BlocProvider.of<AuthBloc>(context).add(
                              ProcessLoginEvent(emailController.text, passwordController.text),
                            );
                          } else {
                            final snackBar = CustomSnackBar(
                              context: context,
                              text: 'Заповніть всі поля',
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                      ),
                    ],
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
                      Text(
                        'Dator',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Raleway',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
