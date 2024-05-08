import 'package:dating_app/widgets/round_copmonents/round_title.dart';
import 'package:dating_app/widgets/swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../../../colors.dart';
import '../bloc/swipe_cards_bloc.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({super.key});

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  final CardSwiperController controller = CardSwiperController();
  // final List<String> names = ['Настя', 'Олександр', 'Аня', 'Олеггг', 'Aнтон'];


  @override
  void initState() {
    BlocProvider.of<SwipeCardsBloc>(context).add(
      SwipeCardsFetchEvent(),
    );
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    if (direction.name == 'right') {
      BlocProvider.of<SwipeCardsBloc>(context).add(
          SwipeCardsRightEvent(previousIndex)
      );

    } else {
      BlocProvider.of<SwipeCardsBloc>(context).add(
          SwipeCardsLeftEvent(previousIndex)
      );

    }
    // print(
    //   'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    // );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: BlocConsumer<SwipeCardsBloc, SwipeCardsState>(
        listenWhen: (previous, current) => current is SwipeCardsActionState,
        buildWhen: (previous, current) => current is! SwipeCardsActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SwipeCardsInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwipeCardsLoading) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    const RoundTitle(titleText: 'пошук піплов'),
                    Flexible(
                      child: CardSwiper(
                        initialIndex: 2,
                        allowedSwipeDirection:
                            const AllowedSwipeDirection.symmetric(
                                horizontal: true, vertical: false),
                        controller: controller,
                        onSwipe: _onSwipe,
                        cardsCount: state.names.length,
                        numberOfCardsDisplayed: 3,
                        backCardOffset: const Offset(0, 0),
                        cardBuilder: (
                          context,
                          index,
                          horizontalThresholdPercentage,
                          verticalThresholdPercentage,
                        ) =>
                            SwipeCard(buttonText: state.names[index]),
                      ),
                    ),
                    // const Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     RoundSwipeButton(path: 'assets/icons/no.svg', horizontal: 25),
                    //     SizedBox(width: 50),
                    //     RoundSwipeButton(path: 'assets/icons/yes.svg', horizontal: 23),
                    //   ],
                    // ),
                    // const SizedBox(height: 20),
                    // BigButton(
                    //   buttonText: 'Розпочати',
                    //   onTap: () {
                    //     context.push('/');
                    //   },
                    // ),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
