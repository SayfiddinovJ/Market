import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/bloc/auth_bloc/auth_event.dart';
import 'package:market/data/models/status.dart';
import 'package:market/data/models/universal_data.dart';
import 'package:market/data/models/user/user_model.dart';
import 'package:market/data/models/user/user_model_fields.dart';
import 'package:market/repositories/auth_repository.dart';
import 'package:market/repositories/user_repository.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository, required this.userRepository})
      : super(
          AuthState(
            userModel: UserModel(
              fullName: '',
              email: '',
              createdAt: '',
              userId: '',
              password: '',
              role: '',
            ),
            status: FormStatus.pure,
            statusMessage: '',
          ),
        ) {
    on<AuthEvent>((event, emit) {});
    on<LogOutEvent>(logOutUser);
    on<RegisterEvent>(register);
    on<LogInEvent>(logIn);
  }

  final AuthRepository authRepository;
  final UserRepository userRepository;

  Future<void> logOutUser(LogOutEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data = await authRepository.logOutUser();
    if (data.error.isEmpty) {
      emit(state.copyWith(status: FormStatus.unauthenticated));
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusMessage: data.error,
        ),
      );
    }
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data =
        await authRepository.registerUser(userModel: state.userModel);
    if (data.error.isEmpty) {
      emit(state.copyWith(status: FormStatus.authenticated));
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusMessage: data.error,
        ),
      );
    }
    emit(state.copyWith(status: FormStatus.pure));
  }

  Future<void> logIn(LogInEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data =
        await authRepository.logInUser(userModel: state.userModel);
    if (data.error.isEmpty) {
      emit(state.copyWith(status: FormStatus.authenticated));
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusMessage: data.error,
        ),
      );
    }
    emit(state.copyWith(status: FormStatus.pure));
  }

  String canRegister() {
    return state.canRegister();
  }

  String canLogIn() {
    return state.canLogIn();
  }

  updateCurrentCoffeeField(
      UpdateCurrentUserEvent updateCurrentUserEvent, Emitter<AuthState> emit) {
    UserModel user = state.userModel;

    switch (updateCurrentUserEvent.fieldKey) {
      case UserFieldKeys.name:
        user = user.copyWith(fullName: updateCurrentUserEvent.value as String);
        break;

      case UserFieldKeys.userId:
        user = user.copyWith(userId: updateCurrentUserEvent.value as String);
        break;

      case UserFieldKeys.createdAt:
        user = user.copyWith(createdAt: updateCurrentUserEvent.value as String);
        break;

      case UserFieldKeys.role:
        user = user.copyWith(role: updateCurrentUserEvent.value as String);
        break;

      case UserFieldKeys.email:
        user = user.copyWith(email: updateCurrentUserEvent.value as String);
        break;

      case UserFieldKeys.password:
        user = user.copyWith(password: updateCurrentUserEvent.value as String);
        break;
    }

    debugPrint("Coffee Model: $user");
    emit(state.copyWith(userModel: user));
  }
}
