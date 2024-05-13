import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../user_profile/models/user_model.dart';
import '../repos/creating_profile_repo.dart';

part 'creating_profile_event.dart';
part 'creating_profile_state.dart';

class CreatingProfileBloc
    extends Bloc<CreatingProfileEvent, CreatingProfileState> {
  final CreatingProfileRepo _creatingProfileRepo;

  CreatingProfileBloc(this._creatingProfileRepo)
      : super(CreatingProfileInitial()) {
    on<CreatingProfileFetchEvent>(creatingProfileFetchEvent);
    on<RegionDropdownValueChangedEvent>(regionDropdownValueChangedEvent);
    on<CommunityDropdownValueChangedEvent>(communityDropdownValueChangedEvent);
    on<CityDropdownValueChangedEvent>(cityDropdownValueChangedEvent);
    on<HobbiesAddedEvent>(hobbiesAddedEvent);
    on<HobbiesRemovedEvent>(hobbiesRemovedEvent);
    on<CreatingProfileValidateEvent>(creatingProfileValidateEvent);
  }

  List<String> regions = [];
  List<Map<String, dynamic>> communitiesMap = [];
  List<String> communitiesList = [];
  List<String> cities = [];

  late String? region = null;
  late String? community = null;
  late String? city = null;

  List<String> hobbies = [
    'фотографія',
    'кулінарія',
    'книги',
    'спорт',
    'подорожі',
    'психологія',
    'технології',
    'наука',
    'історія',
    'музика',
    'танці',
    'лінгвістика',
    'настільні ігри',
    'колекціонування',
    'театр',
    'мода',
    'кіно',
    'письмо',
    'вокал',
    'комп\'ютерні ігри',
  ];

  List<String> selectedHobbies = [];

  FutureOr<void> creatingProfileFetchEvent(CreatingProfileFetchEvent event,
      Emitter<CreatingProfileState> emit) async {
    List<dynamic> areas = await _creatingProfileRepo.fetchRegions();

    regions = areas.map((area) => area['title'].toString()).toList();

    emit(
      CreatingProfileLoading(
        regions: regions,
        communities: communitiesList,
        cities: cities,
        hobbies: hobbies,
        selectedHobbies: selectedHobbies,
      ),
    );
  }

  FutureOr<void> regionDropdownValueChangedEvent(
      RegionDropdownValueChangedEvent event,
      Emitter<CreatingProfileState> emit) async {
    communitiesMap.clear();
    communitiesList.clear();
    List<dynamic> communities = await _creatingProfileRepo.fetchCommunities();
    region = event.selectedRegion;

    communitiesMap = communities
        .where((community) => community['area_name'] == region)
        .map(
            (community) => {'title': community['title'], 'id': community['id']})
        .toList();

    communitiesList = communities
        .where((community) => community['area_name'] == region)
        .map((community) => community['title'].toString())
        .toList();

    emit(
      CreatingProfileLoading(
        regions: regions,
        communities: communitiesList,
        cities: cities,
        hobbies: hobbies,
        selectedHobbies: selectedHobbies,
      ),
    );
  }

  FutureOr<void> communityDropdownValueChangedEvent(
      CommunityDropdownValueChangedEvent event,
      Emitter<CreatingProfileState> emit) async {
    cities.clear();
    community = event.selectedCommunity;
    late int desiredCommunityId;

    for (var communityItem in communitiesMap) {
      if (communityItem['title'] == community) {
        desiredCommunityId = communityItem['id'];
      }
    }

    if (community == 'Київ') {
      cities = ['Київ'];
    } else {
      List<dynamic> citiesResult =
          await _creatingProfileRepo.fetchCities(desiredCommunityId);

      for (var city in citiesResult) {
        cities.add(city['title']);
      }
    }

    emit(
      CreatingProfileLoading(
        regions: regions,
        communities: communitiesList,
        cities: cities,
        hobbies: hobbies,
        selectedHobbies: selectedHobbies,
      ),
    );
  }

  FutureOr<void> cityDropdownValueChangedEvent(
      CityDropdownValueChangedEvent event, Emitter<CreatingProfileState> emit) {
    city = event.selectedCity;
    print('Область - $region');
    print('Громада - $community');
    print('Місто - $city');
  }

  FutureOr<void> hobbiesAddedEvent(
      HobbiesAddedEvent event, Emitter<CreatingProfileState> emit) {
    selectedHobbies.add(event.selectedHobby);
    emit(
      CreatingProfileLoading(
        regions: regions,
        communities: communitiesList,
        cities: cities,
        hobbies: hobbies,
        selectedHobbies: selectedHobbies,
      ),
    );
  }

  FutureOr<void> hobbiesRemovedEvent(
      HobbiesRemovedEvent event, Emitter<CreatingProfileState> emit) {
    selectedHobbies.remove(event.selectedHobby);
    emit(
      CreatingProfileLoading(
        regions: regions,
        communities: communitiesList,
        cities: cities,
        hobbies: hobbies,
        selectedHobbies: selectedHobbies,
      ),
    );
  }

  FutureOr<void> creatingProfileValidateEvent(
      CreatingProfileValidateEvent event,
      Emitter<CreatingProfileState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('id');

    UserModel user = UserModel(
      id: id,
      name: event.name,
      age: event.age,
      photo: event.photo,
      gender: event.gender,
      phone: event.phone,
      searchPurpose: event.searchPurpose,
      city: city,
      hobbies: hobbies,
    );

    try {
      await _creatingProfileRepo.createProfile(id, user);
      emit(CreatingProfileSuccess());
    } catch (e) {
      emit(CreatingProfileFailed(e.toString()));
    }

    // List<int> photoCode= event.photo!.toList();
    // String photo = base64Encode(photoCode);
  }
}
