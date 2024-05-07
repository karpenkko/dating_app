part of 'creating_profile_bloc.dart';

@immutable
sealed class CreatingProfileState {}

abstract class CreatingProfileActionState extends CreatingProfileState {}

final class CreatingProfileInitial extends CreatingProfileState {}

final class CreatingProfileLoading extends CreatingProfileState {
  final List<String> regions;
  final List<String> communities;
  final List<String> cities;
  CreatingProfileLoading({required this.regions, required this.communities, required this.cities});
}

