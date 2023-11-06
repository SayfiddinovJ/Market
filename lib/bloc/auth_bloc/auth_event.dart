import 'package:market/data/models/user/user_model_fields.dart';

abstract class AuthEvent {}

class LogInEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}

class UpdateCurrentUserEvent extends AuthEvent {
  final UserFieldKeys fieldKey;
  final dynamic value;

  UpdateCurrentUserEvent({
    required this.fieldKey,
    required this.value,
  });
}
