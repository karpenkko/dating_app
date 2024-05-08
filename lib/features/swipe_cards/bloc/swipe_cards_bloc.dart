import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'swipe_cards_event.dart';
part 'swipe_cards_state.dart';

class SwipeCardsBloc extends Bloc<SwipeCardsEvent, SwipeCardsState> {
  SwipeCardsBloc() : super(SwipeCardsInitial()) {
    on<SwipeCardsFetchEvent>(swipeCardsFetchEvent);
    on<SwipeCardsRightEvent>(swipeCardsRightEvent);
    on<SwipeCardsLeftEvent>(swipeCardsLeftEvent);
  }

  final List<String> names = ['Настя', 'Олександр', 'Аня', 'Олеггг', 'Aнтон'];

  FutureOr<void> swipeCardsFetchEvent(SwipeCardsFetchEvent event, Emitter<SwipeCardsState> emit) {
    emit(SwipeCardsLoading(names));
  }

  FutureOr<void> swipeCardsRightEvent(SwipeCardsRightEvent event, Emitter<SwipeCardsState> emit) {
    print('схвалено');
  }

  FutureOr<void> swipeCardsLeftEvent(SwipeCardsLeftEvent event, Emitter<SwipeCardsState> emit) {
    print('не схвалено');
  }


}
