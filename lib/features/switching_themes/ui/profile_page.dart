import 'package:dating_app/widgets/round_copmonents/round_title.dart';
import 'package:dating_app/widgets/swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme_bloc.dart';
import '../utils/colors.dart';
import '../utils/themes.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
          child: Column(
            children: [
              const RoundTitle(titleText: 'ваш профіль'),
              const SizedBox(height: 20),
              const Flexible(
                child: SwipeCard(
                  buttonText: 'Asya',
                  showDottedBorder: false,
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<ThemeBloc, ThemeData>(
                builder: (context, state) {
                  return Switch(
                    value: state == AppThemes.appThemeData[AppTheme.darkTheme],
                    onChanged: (bool val) {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(ThemeSwitchEvent());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
