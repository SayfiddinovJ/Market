part of 'auth_bloc.dart';

class AuthState {
  const AuthState({
    required this.userModel,
    required this.status,
    required this.statusMessage,
  });

  final UserModel userModel;
  final FormStatus status;
  final String statusMessage;

  AuthState copyWith({
    String? statusMessage,
    UserModel? userModel,
    FormStatus? status,
  }) =>
      AuthState(
        userModel: userModel ?? this.userModel,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
      );

  String canLogIn() {
    if (userModel.email.isEmpty) return "Emailingizni kiriting";
    if (userModel.password.isEmpty) return "Parolingizni kiriting";
    return "";
  }

  String canRegister() {
    if (userModel.fullName.isEmpty) return "Ismingizni kiriting";
    if (userModel.email.isEmpty) return "Emailingizni kiriting";
    if (userModel.password.isEmpty) return "Parolingizni kiriting";
    return "";
  }

  @override
  String toString() {
    return '''
    Username: $userModel
    Status: $status
    Status Text: $statusMessage
    ''';
  }
}
