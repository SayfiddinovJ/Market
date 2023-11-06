import 'package:market/data/firebase/auth_service.dart';
import 'package:market/data/models/universal_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market/data/models/user/user_model.dart';

class AuthRepository {
  AuthRepository({required this.authService});

  final AuthService authService;

  Future<UniversalData> registerUser({required UserModel userModel}) =>
      authService.registerUser(userModel: userModel);

  Future<UniversalData> logInUser({required UserModel userModel}) =>
      authService.logInUser(userModel: userModel);

  Future<UniversalData> logOutUser() => authService.logOutUser();

  Stream<User?> listenAuthState() => FirebaseAuth.instance.authStateChanges();
}
