import 'package:dating_app/widgets/round_copmonents/round_title.dart';
import 'package:flutter/material.dart';

import '../../switching_themes/utils/colors.dart';
import '../../../widgets/cards/connect_card.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            child: Column(
              children: [
                RoundTitle(titleText: 'ваші конекти'),
                SizedBox(height: 60),
                ConnectCard(buttonText: 'Олександр'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
