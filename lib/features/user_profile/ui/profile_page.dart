import 'package:dating_app/widgets/round_copmonents/round_title.dart';
import 'package:dating_app/widgets/cards/swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../switching_themes/bloc/theme_bloc.dart';
import '../../switching_themes/utils/colors.dart';
import '../../switching_themes/utils/themes.dart';
import '../bloc/user_profile_bloc.dart';
import '../models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    BlocProvider.of<UserProfileBloc>(context).add(
      UserProfileFetchEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileInitial){
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is UserProfileFetch) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 10, left: 20, right: 20),
                child: Column(
                  children: [
                    const RoundTitle(titleText: 'ваш профіль'),
                    const SizedBox(height: 20),
                    Flexible(
                      child: SwipeCard(
                        user: state.user,
                        showDottedBorder: false,
                      ),
                    ),
                    const SizedBox(height: 10),
                    BlocBuilder<ThemeBloc, ThemeData>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'тема',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Switch(
                              activeTrackColor: AppColor.purpleColor,
                              inactiveTrackColor:
                              Theme.of(context).scaffoldBackgroundColor,
                              inactiveThumbColor: Theme.of(context).primaryColor,
                              trackOutlineColor:
                              MaterialStateColor.resolveWith((states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Theme.of(context)
                                      .scaffoldBackgroundColor;
                                }
                                return Theme.of(context).primaryColor;
                              }),
                              trackOutlineWidth:
                              MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return 1;
                                }
                                return 1;
                              }),
                              value: state ==
                                  AppThemes.appThemeData[AppTheme.darkTheme],
                              onChanged: (bool val) {
                                BlocProvider.of<ThemeBloc>(context)
                                    .add(ThemeSwitchEvent());
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else{
          return const Scaffold(
            body: Center(
              child: Text('Сталася помилка під час завантаження профілю.'),
            ),
          );
        }
      },
    );
  }
}
