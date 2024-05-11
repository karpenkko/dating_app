import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class AuthRepository {
  String apiUrl = 'https://fs-mt.qwerty123.tech';

  Future<void> requestLogin(String email, String password) async {
    // var dio = Dio();
    // String language = await SecureStorage.getLang();
    // language = language.isEmpty ? 'en' : language;
    //
    // Response response = await dio.post(
    //   '$apiUrl/api/auth/otp',
    //   options: Options(headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //     'Accept-Language': language,
    //   }),
    //   data: {
    //     "phoneNumber": phoneNumber,
    //   },
    // );

    // if (response.statusCode == 200) {
    //   final bool result = response.data['success'];
    //   return result; // response.body;
    // } else {
    //   throw Exception(response.statusMessage);
    // }
  }


    Future<void> requestSignup(String email, String password) async {
      // var dio = Dio();
      // String language = await SecureStorage.getLang();
      // language = language.isEmpty ? 'en' : language;
      //
      // Response response = await dio.post(
      //   '$apiUrl/api/auth/otp',
      //   options: Options(headers: {
      //     HttpHeaders.contentTypeHeader: "application/json",
      //     'Accept-Language': language,
      //   }),
      //   data: {
      //     "phoneNumber": phoneNumber,
      //   },
      // );

      // if (response.statusCode == 200) {
      //   final bool result = response.data['success'];
      //   return result; // response.body;
      // } else {
      //   throw Exception(response.statusMessage);
      // }
    }
}