import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dating_app/features/swipe_cards/repos/swiping_cards_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'swipe_cards_event.dart';
part 'swipe_cards_state.dart';

class SwipeCardsBloc extends Bloc<SwipeCardsEvent, SwipeCardsState> {
  SwipeCardsBloc() : super(SwipeCardsInitial()) {
    on<SwipeCardsFetchEvent>(swipeCardsFetchEvent);
    on<SwipeCardsRightEvent>(swipeCardsRightEvent);
    on<SwipeCardsLeftEvent>(swipeCardsLeftEvent);
    on<SwipeCardsPaymentEvent>(swipeCardsPaymentEvent);
  }

  final List<String> names = ['Настя', 'Олександр', 'Аня', 'Олеггг', 'Aнтон'];
  final List<String> names2 = ['Гедеон', 'Данте', 'Аід'];
  int counter = 30;

  FutureOr<void> swipeCardsFetchEvent(SwipeCardsFetchEvent event, Emitter<SwipeCardsState> emit) {
    counter = counter - 10;
    if (counter == 20) {
      emit(SwipeCardsLoading(names));
    } if (counter != 0){
      emit(SwipeCardsLoading(names2));
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

    counter = 20;
    emit(SwipeCardsLoading(names));
  }
}
