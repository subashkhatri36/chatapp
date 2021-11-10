import 'dart:convert';
import 'package:chatdemoapp/src/core/controllers/home_page_controller.dart';
import 'package:chatdemoapp/src/core/repositories/user_information_repo.dart';
import 'package:chatdemoapp/src/data/model/user_model.dart';
import 'package:chatdemoapp/src/utils/storage/shared_preference.dart';

class UserRepositoires implements UserInfoRepo {
  static String key = "User";
  @override
  Future<List<UserModel>> getAllUser() async {
    List<UserModel> userList = [];

    var data = await shareprefrence.read(key);
    if (data.isNotEmpty) {
      for (var val in json.decode(data)) {
        userList.add(UserModel.fromJson(val));
      }
    }
    return userList;
  }

  @override
  Future<int> updateUser() async {
    var v =
        await shareprefrence.save(key, homeController.userModelList.toJson());
    if (v != null) {
      return 1;
    }
    return 0;
  }

  @override
  Future<int> insertNewUser() async {
    var v =
        await shareprefrence.save(key, homeController.userModelList.toJson());
    if (v != null) {
      return 1;
    }
    return 0;
  }
}
