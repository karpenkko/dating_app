part of 'swipe_cards_bloc.dart';

@immutable
sealed class SwipeCardsState {}

abstract class SwipeCardsActionState extends SwipeCardsState {}

final class SwipeCardsInitial extends SwipeCardsState {}

final class SwipeCardsLoading extends SwipeCardsState {
  final List<UserModel> users;
  SwipeCardsLoading(this.users);
}

final class SwipeCardsEnded extends SwipeCardsState {}

class SwipeCardsErrorState extends SwipeCardsState {
  final String error;
  SwipeCardsErrorState(this.error);
}