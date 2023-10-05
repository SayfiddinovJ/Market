part of 'auth_cubit.dart';

class AuthState  {
  const AuthState({
    this.password = '',
    this.name = '',
    this.phone = '',
    this.status = FormStatus.pure,
    this.statusMessage = "",
  });

  final String name;
  final String phone;
  final String password;
  final FormStatus status;
  final String statusMessage;

  AuthState copyWith({
    String? name,
    String? phone,
    String? statusMessage,
    String? password,
    FormStatus? status,
  }) =>
      AuthState(
        password: password ?? this.password,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
      );

  @override
  String toString() {
    return '''
    Username: $password
    UserAge:$name
    Status:$status
    ''';
  }
}