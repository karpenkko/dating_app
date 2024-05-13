import 'package:dating_app/features/user_profile/models/user_model.dart';
import 'package:dio/dio.dart';

import '../../../link.dart';

class UserProfileRepo {
  Future<UserModel> getUser(int? id) async {
    var dio = Dio();
    print('ID REPO $id');
    Response response = await dio.post(
      '$customLink/api/get_user_info/$id',
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> userData = response.data;
      UserModel user = UserModel.fromJson(userData);
      return user;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
