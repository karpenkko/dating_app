import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/login_button.dart';
import '../../../widgets/login_field.dart';
import '../../switching_themes/utils/colors.dart';
import '../bloc/auth_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignupErrorState) {
            final snackBar = CustomSnackBar(
              context: context,
              text: state.error,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is SignupLoadedState) {
            context.go('/create-profile');
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Text(
                  'Рєєстрація',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Raleway',
                    fontSize: 34,
                    height: 1.2,
                  ),
                ),
                Text(
                  'чи вже маєте аккаунт?',
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
                  onTap: () => context.go('/signup/login'),
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
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                LoginField(
                  controller: checkPasswordController,
                  hintText: 'Підтвердіть пароль',
                  length: 18.0,
                  obscureText: true,
                ),
                const SizedBox(height: 60),
                LoginButton(
                    buttonText: 'Зареєструватись',
                    onPressed: () {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty &&
                          checkPasswordController.text.isNotEmpty) {
                        if (passwordController.text ==
                            checkPasswordController.text) {
                          BlocProvider.of<AuthBloc>(context).add(
                            ProcessSignupEvent(emailController.text, passwordController.text),
                          );
                        } else {
                          final snackBar = CustomSnackBar(
                            context: context,
                            text: 'Паролі не співпадають',
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else {
                        final snackBar = CustomSnackBar(
                          context: context,
                          text: 'Заповніть всі поля',
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }),
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
