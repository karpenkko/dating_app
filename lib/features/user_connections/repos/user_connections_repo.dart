import 'package:dating_app/features/user_profile/models/user_model.dart';
import 'package:dio/dio.dart';

import '../../../link.dart';

class UserConnectionsRepo {
  Future<List<int>> getConnectionsId(int? id) async {

    var dio = Dio();
    Response response = await dio.get(
      '$customLink/api/profiles/1/user_id_likes',
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      List<int> userIds = response.data.map<int>((item) => item['user_id'] as int).toList();
      Set<int> uniqueUserIds = userIds.toSet();
      List<int> uniqueUserIdsList = uniqueUserIds.toList();
      return uniqueUserIdsList;
    } else {
      print(response.statusMessage);
      throw Exception(response.statusMessage);
    }
  }

  Future<List<UserModel>> getConnectionsInfo(List<int> usersId) async {

    List<UserModel> users = [];

    for (int userId in usersId) {
      var dio = Dio();
      Response response = await dio.post(
        '$customLink/api/get_user_info/$userId',
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> userData = response.data;
        UserModel user = UserModel.fromJson(userData);
        users.add(user);
      } else {
        throw Exception(response.statusMessage);
      }
    }

    print(users);

    return users;
  }
}