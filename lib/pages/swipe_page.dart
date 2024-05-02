import 'package:dating_app/widgets/round_copmonents/round_title.dart';
import 'package:dating_app/widgets/swipe_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'package:flutter_svg/svg.dart';

import '../colors.dart';
import '../widgets/buttons/big_button.dart';
import '../widgets/buttons/icon_button.dart';
import '../widgets/buttons/swipe_button.dart';
import '../widgets/login_button.dart';
import '../widgets/login_field.dart';
import 'hobbies_page.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({super.key});

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  final CardSwiperController controller = CardSwiperController();
  final List<String> names = ['Настя', 'Олександр', 'Аня', 'Олег'];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: [
              const RoundTitle(titleText: 'пошук піплов'),
              Flexible(
                child: CardSwiper(
                  controller: controller,
                  cardsCount: names.length,
                  numberOfCardsDisplayed: 3,
                  backCardOffset: const Offset(0, 0),
                  padding: const EdgeInsets.all(20.0),
                  cardBuilder: (
                    context,
                    index,
                    horizontalThresholdPercentage,
                    verticalThresholdPercentage,
                  ) =>
                      SwipeCard(buttonText: names[index]),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundSwipeButton(path: 'assets/icons/no.svg', horizontal: 25),
                  SizedBox(width: 50),
                  RoundSwipeButton(path: 'assets/icons/yes.svg', horizontal: 23),
                ],
              ),
              const SizedBox(height: 20),
              BigButton(
                buttonText: 'Розпочати',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
