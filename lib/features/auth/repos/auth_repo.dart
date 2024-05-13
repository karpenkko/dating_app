import 'package:dio/dio.dart';

import 'package:dating_app/link.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future<int> requestLogin(String email, String password) async {
    var dio = Dio();
    Response response = await dio.get(
      '$customLink/api/login_register_user',
      data: {
        "email": email,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      final int userId = response.data['id'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('id', userId);
      return userId;
    } else {
      throw Exception(response.statusMessage);
    }
  }

  Future<int> requestSignup(String email, String password) async {
    var dio = Dio();
    Response response = await dio.get(
      '$customLink/api/login_register_user',
      data: {
        "email": email,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      final int userId = response.data['id'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('id', userId);
      return userId;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
