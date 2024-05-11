part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileState {}

final class UserProfileInitial extends UserProfileState {}

final class UserProfileFetch extends UserProfileState {
  final UserModel user;
  UserProfileFetch(this.user);
}
