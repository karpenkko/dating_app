import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dating_app/features/swipe_cards/repos/swiping_cards_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../user_profile/models/user_model.dart';

part 'swipe_cards_event.dart';
part 'swipe_cards_state.dart';

class SwipeCardsBloc extends Bloc<SwipeCardsEvent, SwipeCardsState> {
  final SwipingCardsRepo _swipingCardsRepo;
  SwipeCardsBloc(this._swipingCardsRepo) : super(SwipeCardsInitial()) {
    on<SwipeCardsFetchEvent>(swipeCardsFetchEvent);
    on<SwipeCardsRightEvent>(swipeCardsRightEvent);
    on<SwipeCardsLeftEvent>(swipeCardsLeftEvent);
    on<SwipeCardsPaymentEvent>(swipeCardsPaymentEvent);
  }

  FutureOr<void> swipeCardsFetchEvent(
      SwipeCardsFetchEvent event, Emitter<SwipeCardsState> emit) async {
    // checking subscription info
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('id');
    String? subscriptionType = prefs.getString('subscription');
    int? swipesAmount = prefs.getInt('swipesAmount');
    String? startDate = prefs.getString('startDate');

    DateTime subscriptionStartDate;

    if (startDate == null) {
      subscriptionStartDate = DateTime.now();
    } else {
      subscriptionStartDate = DateTime.parse(startDate);
    }

    DateTime currentDate = DateTime.now();
    String formattedDate =
        "${currentDate.year}-${currentDate.month}-${currentDate.day}";

    if (subscriptionType == null) {
      // create free subscription after registration

      try {
        final resultSubscription =
            await _swipingCardsRepo.createSubscription(id, formattedDate);
      } catch (e) {
        emit(SwipeCardsErrorState(e.toString()));
      }

      prefs.setString('subscriptionType', 'free');
      prefs.setInt('swipesAmount', 0);
      prefs.setString('startDate', currentDate.toString());

      try {
        final resultCards = await _swipingCardsRepo.getSwipeCards();
        print('Sub null before 100 $resultCards');
        List<UserModel> userCards = resultCards.sublist(0, 100);
        print('Sub null $userCards');
        emit(SwipeCardsLoading(userCards));
      } catch (e) {
        emit(SwipeCardsErrorState(e.toString()));
      }
    } else if (subscriptionType == 'free') {
      if (currentDate.difference(subscriptionStartDate).inDays >= 30) {
        if (swipesAmount! <= 100) {
          try {
            final resultCards = await _swipingCardsRepo.getSwipeCards();
            List<UserModel> userCards =
                resultCards.sublist(0, 100 - swipesAmount);
            print('Sub free $userCards');
            emit(SwipeCardsLoading(userCards));
          } catch (e) {
            emit(SwipeCardsErrorState(e.toString()));
          }
        } else {
          emit(SwipeCardsEnded());
        }
      } else {
        // update free subscription swipe amount
        try {
          final resultSubscription =
              await _swipingCardsRepo.createSubscription(id, formattedDate);
        } catch (e) {
          emit(SwipeCardsErrorState(e.toString()));
        }

        prefs.setString('subscriptionType', 'free');
        prefs.setInt('swipesAmount', 0);
        prefs.setString('startDate', currentDate.toString());
      }
    } else if (currentDate.difference(subscriptionStartDate).inDays >= 30) {
      emit(SwipeCardsEnded());
    } else {
      try {
        final resultCards = await _swipingCardsRepo.getSwipeCards();
        emit(SwipeCardsLoading(resultCards));
      } catch (e) {
        emit(SwipeCardsErrorState(e.toString()));
      }
    }
  }

  FutureOr<void> swipeCardsRightEvent(
      SwipeCardsRightEvent event, Emitter<SwipeCardsState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('id');

    String? subscriptionType = prefs.getString('subscription');
    int? swipesAmount = prefs.getInt('swipesAmount');
    int newSwipesAmount = swipesAmount! + 1;
    prefs.setInt('swipesAmount', newSwipesAmount);

    if (subscriptionType == 'free' && swipesAmount == 100) {
      emit(SwipeCardsEnded());
    }

    try {
      final resultCards = await _swipingCardsRepo.likeUser(id, event.user.id);
    } catch (e) {
      emit(SwipeCardsErrorState(e.toString()));
    }
  }

  FutureOr<void> swipeCardsLeftEvent(
      SwipeCardsLeftEvent event, Emitter<SwipeCardsState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('id');

    String? subscriptionType = prefs.getString('subscription');
    int? swipesAmount = prefs.getInt('swipesAmount');
    int newSwipesAmount = swipesAmount! + 1;
    prefs.setInt('swipesAmount', newSwipesAmount);

    if (subscriptionType == 'free' && swipesAmount == 100) {
      emit(SwipeCardsEnded());
    }
  }

  FutureOr<void> swipeCardsPaymentEvent(
      SwipeCardsPaymentEvent event, Emitter<SwipeCardsState> emit) async {
    Map<String, dynamic>? paymentIntent =
        await SwipingCardsRepo.fetchPaymentIntent();
    await SwipingCardsRepo.fetchInitPaymentSheet(paymentIntent);
    await SwipingCardsRepo.fetchPresentPaymentSheet();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('id');
    String? startDate = prefs.getString('startDate');

    DateTime currentDate = DateTime.now();
    String formattedDate =
        "${currentDate.year}-${currentDate.month}-${currentDate.day}";

    try {
      final resultSubscription =
          await _swipingCardsRepo.updateSubscription(id, formattedDate);
    } catch (e) {
      emit(SwipeCardsErrorState(e.toString()));
    }

    prefs.setString('subscriptionType', 'premium');
    prefs.setInt('swipesAmount', 0);
    prefs.setString('startDate', currentDate.toString());

    try {
      final resultCards = await _swipingCardsRepo.getSwipeCards();
      emit(SwipeCardsLoading(resultCards));
    } catch (e) {
      emit(SwipeCardsErrorState(e.toString()));
    }
  }
}
