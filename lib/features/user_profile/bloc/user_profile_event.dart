part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileEvent {}

final class UserProfileFetchEvent extends UserProfileEvent {}
