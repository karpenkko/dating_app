part of 'creating_profile_bloc.dart';

@immutable
sealed class CreatingProfileEvent {}

class CreatingProfileFetchEvent extends CreatingProfileEvent {}

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

class HobbiesAddedEvent extends CreatingProfileEvent {
  final String selectedHobby;
  HobbiesAddedEvent(this.selectedHobby);
}

class HobbiesRemovedEvent extends CreatingProfileEvent {
  final String selectedHobby;
  HobbiesRemovedEvent(this.selectedHobby);
}

class CreatingProfileValidateEvent extends CreatingProfileEvent {
  final Uint8List? photo;
  final String name;
  final int age;
  final String? gender;
  final String? phone;
  final String? searchPurpose;

  CreatingProfileValidateEvent(
    this.photo,
      this.name,
      this.age,
      this.gender,
      this.phone,
      this.searchPurpose,
  );
}
