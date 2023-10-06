part of 'get_user_cubit.dart';

abstract class GetUserState {}

class GetUserLoading extends GetUserState {}

class GetUserSuccess extends GetUserState {
  final UserModel user;

  GetUserSuccess(this.user);
}

class GetUserError extends GetUserState {
  final String errorMessage;

  GetUserError(this.errorMessage);
}
