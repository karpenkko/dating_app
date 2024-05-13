import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dating_app/features/swipe_cards/repos/swiping_cards_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:dating_app/data.dart';
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

  // final List<String> names = ['Настя', 'Олександр', 'Аня', 'Олеггг', 'Aнтон'];
  // final List<String> names2 = ['Гедеон', 'Данте', 'Аід'];
  // final List<Map<String, dynamic>> names2 = [
  //   {'id': 1, 'name': 'Гедеон',},
  //   {'id': 2, 'name': 'Данте',},
  //   {'id': 3, 'name': 'Аід',},
  //   {'id': 4, 'name': 'Аід2',},
  //   {'id': 5, 'name': 'Аід3',},
  //   {'id': 6, 'name': 'Аід4',},
  //   {'id': 7, 'name': 'Аід5',},];
  int counter = 20;

  FutureOr<void> swipeCardsFetchEvent(SwipeCardsFetchEvent event, Emitter<SwipeCardsState> emit) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('id');
    String? subscriptionType = prefs.getString('subscription');

    DateTime currentDate = DateTime.now();
    String formattedDate = "${currentDate.year}-${currentDate.month}-${currentDate.day}";

    DateTime date = DateTime.now();

    if (subscriptionType == null) {
      try {
        final result = await _swipingCardsRepo.createSubscription(id, formattedDate);
      } catch (e) {
        emit(SwipeCardsErrorState(e.toString()));
      }
    }

    counter = counter - 10;
    if (counter == 20) {
      emit(SwipeCardsLoading(users));
    } else if (counter != 0){
      emit(SwipeCardsLoading(freeUsers));
    } else {
      emit(SwipeCardsEnded());
    }

  }

  FutureOr<void> swipeCardsRightEvent(SwipeCardsRightEvent event, Emitter<SwipeCardsState> emit) {
    print('схвалено');
  }

  FutureOr<void> swipeCardsLeftEvent(SwipeCardsLeftEvent event, Emitter<SwipeCardsState> emit) {
    print('не схвалено');
  }


  FutureOr<void> swipeCardsPaymentEvent(SwipeCardsPaymentEvent event, Emitter<SwipeCardsState> emit) async{

    Map<String, dynamic>? paymentIntent = await SwipingCardsRepo.fetchPaymentIntent();

    await SwipingCardsRepo.fetchInitPaymentSheet(paymentIntent);

    await SwipingCardsRepo.fetchPresentPaymentSheet();

    // counter = 20;
    emit(SwipeCardsLoading(users));
  }
}
