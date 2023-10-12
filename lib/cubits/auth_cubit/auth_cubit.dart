import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/data/models/status.dart';
import 'package:market/data/models/universal_data.dart';
import 'package:market/repositories/auth_repository.dart';
import 'package:market/utils/constants/constants.dart';
import 'package:market/utils/dialog/circular_dialog.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(const AuthState());

  final AuthRepository authRepository;

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updatePhone(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void updatePhotoURL(String photoURL) {
    emit(state.copyWith(photoURL: photoURL));
  }

  Future<void> logOutUser(context) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);
    UniversalData data = await authRepository.logOutUser();
    hideLoading(context: context);
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

  Future<void> signUp(context) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);
    UniversalData data = await authRepository.signUpUser(
      email: state.name,
      password: state.password,
      isAdmin: admins.contains(state.name),
    );
    hideLoading(context: context);
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

  Future<void> logIn(context) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);
    UniversalData data = await authRepository.loginUser(
      email: state.name,
      password: state.password,
      isAdmin: admins.contains(state.name),
      photoURL: state.photoURL,
    );
    hideLoading(context: context);
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

  clear() {
    emit(state.copyWith(password: '', name: ''));
  }

  String canAuthenticate() {
    if (state.name.isEmpty) {
      return "Ismingizni kiriting";
    }
    if (state.password.length < 4) {
      return "Parolingizni kiriting";
    }
    return "";
  }

  String canRegister() {
    if (state.name.isEmpty) {
      return "Ismingizni kiriting";
    }
    if (state.phone.isEmpty) {
      return "Telefon raqamingizni kiriting";
    }
    if (state.password.length < 4) {
      return "Parolingizni kiriting";
    }
    return "";
  }
}
