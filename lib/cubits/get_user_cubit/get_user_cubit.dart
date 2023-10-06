import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/data/firebase/user_service.dart';
import 'package:market/data/models/user/user_model.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  UserRepository userService;

  GetUserCubit(this.userService) : super(GetUserLoading());

  fetchClientData(String userId) async {
    emit(GetUserLoading());
    final response = await userService.getUserByUserId(userId);
    response.isSuccess
        ? emit(GetUserSuccess(response.data))
        : emit(GetUserError(response.errorMessage!));
  }
}
