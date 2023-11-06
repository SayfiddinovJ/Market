import 'package:market/data/firebase/user_service.dart';
import 'package:market/data/models/result.dart';
import 'package:market/data/models/universal_data.dart';
import 'package:market/data/models/user/user_model.dart';

class UserRepository {
  UserRepository({required this.userService});

  final UserService userService;

  Future<UniversalData> addUser({required UserModel userModel}) =>
      userService.addUser(userModel: userModel);

  Future<UniversalData> updateUser({required UserModel userModel}) =>
      userService.updateUser(userModel: userModel);

  Future<UniversalData> deleteUser() => userService.deleteUser();

  Future<Result> getUser() => userService.getUserByUserId();
}
