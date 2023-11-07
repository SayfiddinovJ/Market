import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/data/models/universal_data.dart';
import 'package:market/data/models/user/user_model.dart';
import 'package:market/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserRepository userRepository;

  UserCubit(this.userRepository) : super(GetUserLoading());

  fetchClientData() async {
    emit(GetUserLoading());
    UniversalData data = await userRepository.getUser();
    if (data.error.isEmpty) {
      emit(GetUserSuccess(data.data));
    } else {
      emit(GetUserError(data.error));
    }
  }
}
