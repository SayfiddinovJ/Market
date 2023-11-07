part of 'user_cubit.dart';

abstract class UserState {}

class GetUserLoading extends UserState {}

class GetUserSuccess extends UserState {
  final UserModel user;

  GetUserSuccess(this.user);
}

class GetUserError extends UserState {
  final String errorMessage;

  GetUserError(this.errorMessage);
}
