import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class CreatingProfileRepo {
  static Future<List<dynamic>> fetchRegions() async {
    var client = http.Client();
    try {
      var regionsResponse = await client.post(Uri.parse(
          'https://decentralization.ua/graphql?query={areas{title}}'));

      Map<String, dynamic> regionsData = json.decode(regionsResponse.body);
      List<dynamic> areas = regionsData['data']['areas'];

      return areas;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<List<dynamic>> fetchCommunities() async {
    var client = http.Client();
    try {
      var communitiesResponse = await client.post(Uri.parse(
          'https://decentralization.ua/graphql?query={communities{title,id,area_name}}'));

      Map<String, dynamic> communitiesData =
      json.decode(communitiesResponse.body);
      List<dynamic> communities = communitiesData['data']['communities'];

      return communities;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<List<dynamic>> fetchCities(int desiredCommunityId) async {
    var client = http.Client();
    try {
      var citesResponse = await client.post(Uri.parse(
          'https://decentralization.ua/graphql?query={community(id:"$desiredCommunityId"){id,title,villages{title}}}'));

      Map<String, dynamic> citesData = json.decode(citesResponse.body);
      List<dynamic> citiesResult = citesData['data']['community']['villages'];

      return citiesResult;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}