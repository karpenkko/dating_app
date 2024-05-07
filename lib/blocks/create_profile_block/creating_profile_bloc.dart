import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'creating_profile_event.dart';
part 'creating_profile_state.dart';

class CreatingProfileBloc
    extends Bloc<CreatingProfileEvent, CreatingProfileState> {
  CreatingProfileBloc() : super(CreatingProfileInitial()) {
    on<CreatingProfileFetchEvent>(creatingProfileFetchEvent);
    on<RegionDropdownValueChangedEvent>(regionDropdownValueChangedEvent);
    on<CommunityDropdownValueChangedEvent>(communityDropdownValueChangedEvent);
    on<CityDropdownValueChangedEvent>(cityDropdownValueChangedEvent);
  }

  List<String> regions = [];
  List<Map<String, dynamic>> communitiesMap = [];
  List<String> communitiesList = [];
  List<String> cities = [];

  late String region;
  late String community;
  late String city;

  FutureOr<void> creatingProfileFetchEvent(CreatingProfileFetchEvent event,
      Emitter<CreatingProfileState> emit) async {
    var client = http.Client();
    try {
      var regionsResponse = await client.post(Uri.parse(
          'https://decentralization.ua/graphql?query={areas{title}}'));

      Map<String, dynamic> regionsData = json.decode(regionsResponse.body);
      List<dynamic> areas = regionsData['data']['areas'];

      regions = areas.map((area) => area['title'].toString()).toList();

      emit(
        CreatingProfileLoading(
            regions: regions, communities: communitiesList, cities: cities),
      );
    } finally {
      client.close();
    }
  }

  FutureOr<void> regionDropdownValueChangedEvent(
      RegionDropdownValueChangedEvent event,
      Emitter<CreatingProfileState> emit) async {
    var client = http.Client();
    try {
      communitiesMap.clear();
      communitiesList.clear();
      var communitiesResponse = await client.post(Uri.parse(
          'https://decentralization.ua/graphql?query={communities{title,id,area_name}}'));

      Map<String, dynamic> communitiesData =
          json.decode(communitiesResponse.body);
      List<dynamic> communities = communitiesData['data']['communities'];

      region = event.selectedRegion;

      communitiesMap = communities
          .where((community) => community['area_name'] == region)
          .map((community) =>
              {'title': community['title'], 'id': community['id']})
          .toList();

      communitiesList = communities
          .where((community) => community['area_name'] == region)
          .map((community) => community['title'].toString())
          .toList();

      emit(
        CreatingProfileLoading(
            regions: regions, communities: communitiesList, cities: cities),
      );
    } finally {
      client.close();
    }
  }

  FutureOr<void> communityDropdownValueChangedEvent(
      CommunityDropdownValueChangedEvent event,
      Emitter<CreatingProfileState> emit) async {
    var client = http.Client();
    try {
      cities.clear();
      community = event.selectedCommunity;
      late int desiredCommunityId;

      for (var communityItem in communitiesMap) {
        if (communityItem['title'] == community) {
          desiredCommunityId = communityItem['id'];
        }
      }

      var citesResponse = await client.post(Uri.parse(
          'https://decentralization.ua/graphql?query={community(id:"$desiredCommunityId"){id,title,villages{title}}}'));

      Map<String, dynamic> citesData = json.decode(citesResponse.body);
      List<dynamic> citiesResult = citesData['data']['community']['villages'];

      for (var city in citiesResult) {
        cities.add(city['title']);
      }

      emit(
        CreatingProfileLoading(
            regions: regions, communities: communitiesList, cities: cities),
      );
    } finally {
      client.close();
    }
  }


  FutureOr<void> cityDropdownValueChangedEvent(CityDropdownValueChangedEvent event, Emitter<CreatingProfileState> emit) {
    city = event.selectedCity;
    print('Область - $region');
    print('Громада - $community');
    print('Місто - $city');
  }
}
