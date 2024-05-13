part of 'swipe_cards_bloc.dart';

@immutable
sealed class SwipeCardsEvent {}

final class SwipeCardsFetchEvent extends SwipeCardsEvent {}

final class SwipeCardsRightEvent extends SwipeCardsEvent {
  final UserModel user;
  SwipeCardsRightEvent(this.user);
}

final class SwipeCardsLeftEvent extends SwipeCardsEvent {
  final UserModel user;
  SwipeCardsLeftEvent(this.user);
}

final class SwipeCardsPaymentEvent extends SwipeCardsEvent {
  SwipeCardsPaymentEvent();
}