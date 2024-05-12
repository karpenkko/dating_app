import 'package:dating_app/widgets/round_copmonents/round_title.dart';
import 'package:dating_app/widgets/cards/swipe_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../../../widgets/cards/payment_card.dart';
import '../bloc/swipe_cards_bloc.dart';


class SwipePage extends StatefulWidget {
  const SwipePage({super.key});

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  final CardSwiperController controller = CardSwiperController();

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
      BlocProvider.of<SwipeCardsBloc>(context)
          .add(SwipeCardsRightEvent(previousIndex));
      print('$previousIndex');
    } else {
      BlocProvider.of<SwipeCardsBloc>(context)
          .add(SwipeCardsLeftEvent(previousIndex));
    }
    // print(
    //   'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    // );
    return true;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    const RoundTitle(titleText: 'пошук піплов'),
                    Flexible(
                      child: CardSwiper(
                        isLoop: false,
                        initialIndex: 0,
                        onEnd: () {
                          BlocProvider.of<SwipeCardsBloc>(context)
                              .add(SwipeCardsFetchEvent());
                        },
                        allowedSwipeDirection:
                            const AllowedSwipeDirection.symmetric(
                          horizontal: true,
                          vertical: false,
                        ),
                        controller: controller,
                        onSwipe: _onSwipe,
                        cardsCount: state.users.length,
                        numberOfCardsDisplayed: 2,
                        backCardOffset: const Offset(0, 0),
                        cardBuilder: (
                          context,
                          index,
                          horizontalThresholdPercentage,
                          verticalThresholdPercentage,
                        ) =>
                            SwipeCard(
                          user: state.users[index],
                          showDottedBorder: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is SwipeCardsEnded) {
            return PaymentCard();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
