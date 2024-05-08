part of 'swipe_cards_bloc.dart';

@immutable
sealed class SwipeCardsEvent {}

final class SwipeCardsFetchEvent extends SwipeCardsEvent {}

final class SwipeCardsRightEvent extends SwipeCardsEvent {
  final int swipedCard;
  SwipeCardsRightEvent(this.swipedCard);
}

final class SwipeCardsLeftEvent extends SwipeCardsEvent {
  final int swipedCard;
  SwipeCardsLeftEvent(this.swipedCard);
}