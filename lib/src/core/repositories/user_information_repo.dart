import 'package:chatdemoapp/src/data/model/user_model.dart';
import 'package:chatdemoapp/src/data/repositoires/user_info_repo_imp.dart';

UserInfoRepo userRepo = UserRepositoires();

abstract class UserInfoRepo {
  Future<List<UserModel>> getAllUser();
  Future<int> insertNewUser();
  Future<int> updateUser();
}
