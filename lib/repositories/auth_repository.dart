import 'package:market/data/local/storage_repository.dart';
import 'package:market/data/models/universal_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Future<UniversalData> signUpUser({
    required String email,
    required String password,
    required bool isAdmin,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await StorageRepository.putString('token', isAdmin ? 'admin' : 'user');
      return UniversalData(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.message ?? "");
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> loginUser({
    required String email,
    required String password,
    required bool isAdmin,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await StorageRepository.putString('token', isAdmin ? 'admin' : 'user');
      return UniversalData(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.message ?? "");
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> logOutUser() async {
    try {
      await StorageRepository.deleteString('token');
      await FirebaseAuth.instance.signOut();
      return UniversalData(data: "User Logged Out");
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Stream<User?> listenAuthState() => FirebaseAuth.instance.authStateChanges();
}
