import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/data/models/result.dart';
import 'package:market/data/models/universal_data.dart';
import 'package:market/data/models/user/user_model.dart';

class UserRepository {
  static Future<UniversalData> addUser({required UserModel userModel}) async {
    try {
      DocumentReference newUser = await FirebaseFirestore.instance
          .collection("users")
          .add(userModel.toJson());

      await FirebaseFirestore.instance
          .collection("users")
          .doc(newUser.id)
          .update({
        "user_id": newUser.id,
      });

      return UniversalData(data: "User added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  static Future<UniversalData> updateUser(
      {required UserModel userModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userModel.userId)
          .update(userModel.toJson());

      return UniversalData(data: "User updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  static Future<UniversalData> deleteUser({required String userId}) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(userId).delete();

      return UniversalData(data: "User deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<Result> getUserByUserId(String userId) async {
    try {
      final client = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      return Result.success(UserModel.fromJson(client.data()!));
    } on FirebaseException catch (e) {
      return Result.fail(e.code);
    } catch (e) {
      return Result.fail(e.toString());
    }
  }
}
