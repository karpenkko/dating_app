part of 'creating_profile_bloc.dart';

@immutable
sealed class CreatingProfileEvent {}

class CreatingProfileFetchEvent extends CreatingProfileEvent{}

class RegionDropdownValueChangedEvent extends CreatingProfileEvent {
  final String selectedRegion;
  RegionDropdownValueChangedEvent(this.selectedRegion);
}

class CommunityDropdownValueChangedEvent extends CreatingProfileEvent {
  final String selectedCommunity;
  CommunityDropdownValueChangedEvent(this.selectedCommunity);
}

class CityDropdownValueChangedEvent extends CreatingProfileEvent {
  final String selectedCity;
  CityDropdownValueChangedEvent(this.selectedCity);
}
