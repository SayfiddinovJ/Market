import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/data/models/result.dart';
import 'package:market/data/models/universal_data.dart';
import 'package:market/data/models/user/user_model.dart';

class UserService {
  Future<UniversalData> addUser({required UserModel userModel}) async {
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
      await StorageRepository.putString('user_id', newUser.id);
      return UniversalData(data: "User added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateUser({required UserModel userModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userModel.userId)
          .update(userModel.toJson());

      await StorageRepository.putString('user_id', userModel.userId);
      return UniversalData(data: "User updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteUser() async {
    String userId = StorageRepository.getString('user_id');
    try {
      await FirebaseFirestore.instance.collection("users").doc(userId).delete();

      return UniversalData(data: "User deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<Result> getUserByUserId() async {
    String userId = StorageRepository.getString('user_id');
    try {
      final user = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      return Result.success(UserModel.fromJson(user.data()!));
    } on FirebaseException catch (e) {
      return Result.fail(e.code);
    } catch (e) {
      return Result.fail(e.toString());
    }
  }
}
