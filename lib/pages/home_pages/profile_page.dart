import 'package:dating_app/widgets/round_copmonents/round_title.dart';
import 'package:dating_app/widgets/swipe_card.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
          child: Column(
            children: [
              RoundTitle(titleText: 'ваш профіль'),
              SizedBox(height: 20),
              Flexible(
                child: SwipeCard(
                  buttonText: 'Asya',
                  showDottedBorder: false,
                ),
              ),
              // SizedBox(height: 20),
              // RoundTitle(titleText: 'редагувати'),
            ],
          ),
        ),
      ),
    );
  }
}
