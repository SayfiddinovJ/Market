import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/data/models/universal_data.dart';
import 'package:market/data/models/user/user_model.dart';

class AuthService {
  Future<UniversalData> registerUser({required UserModel userModel}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      await StorageRepository.putString('token', userModel.role);
      return UniversalData(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.message ?? "");
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> logInUser({required UserModel userModel}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      await StorageRepository.putString('token', userModel.role);
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
      await StorageRepository.deleteString('user_id');
      await FirebaseAuth.instance.signOut();
      return UniversalData(data: "User Logged Out");
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return UniversalData(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
