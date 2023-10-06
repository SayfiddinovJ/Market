import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/data/firebase/user_service.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/data/models/status.dart';
import 'package:market/data/models/user/user_model.dart';
import 'package:market/data/models/user/user_model_fields.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UsersState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository})
      : super(UsersState(
          statusText: '',
          userModel: UserModel(
            image: '',
            fullName: '',
            phone: '',
            createdAt: '',
            userId: '',
            password: "",
            email: '',
          ),
          status: FormStatus.pure,
        )) {
    on<UserEvent>((event, emit) {});
    on<AddUserEvent>(addUser);
    on<UpdateUserEvent>(updateUser);
    on<DeleteUserEvent>(deleteUser);
    on<UpdateCurrentUserEvent>(updateCurrentUserField);
  }

  Future<void> addUser(
      AddUserEvent addUserEvent, Emitter<UsersState> emit) async {
    emit(state.copyWith(statusText: "loading...", status: FormStatus.loading));
    await UserRepository.addUser(userModel: state.userModel);
    debugPrint('added');
    emit(state.copyWith(
        status: FormStatus.success, statusText: "User added successfully"));
  }

  Future<void> updateUser(
      UpdateUserEvent updateUserEvent, Emitter<UsersState> emit) async {
    emit(state.copyWith(statusText: "loading...", status: FormStatus.loading));
    await UserRepository.updateUser(userModel: state.userModel);
    emit(state.copyWith(
      status: FormStatus.success,
      statusText: "User updated successfully",
    ));
  }

  Future<void> deleteUser(
      DeleteUserEvent deleteUserEvent, Emitter<UsersState> emit) async {
    emit(state.copyWith(statusText: "loading...", status: FormStatus.loading));
    await UserRepository.deleteUser(userId: deleteUserEvent.userId);
    emit(state.copyWith(
        status: FormStatus.success, statusText: "User deleted successfully"));
  }

  void clearData(DeleteUserEvent deleteUserEvent, Emitter<UsersState> emit) {
    emit(
      UsersState(
        userModel: UserModel(
            image: '',
            password: "",
            fullName: '',
            phone: '',
            createdAt: '',
            userId: '',
            email: ''),
        statusText: "",
        status: FormStatus.unauthenticated,
      ),
    );
  }

  Future<void> getUserByDocId(
      GetUserEvent getUserEvent, Emitter<UsersState> emit) async {
    final userId = StorageRepository.getString('userId');
    final docRef = FirebaseFirestore.instance.collection('users').doc(userId);

    final data = await docRef.get();

    if (data.exists) {
      final userModel = UserModel.fromJson(data.data() as Map<String, dynamic>);
      emit(state.copyWith(userModel: userModel));
    } else {
      debugPrint("Document does not exist ------------------------------");
    }
  }

  updateCurrentUserField(
      UpdateCurrentUserEvent updateCurrentUserEvent, Emitter<UsersState> emit) {
    UserModel currentUser = state.userModel;

    switch (updateCurrentUserEvent.fieldKey) {
      case UserFieldKeys.name:
        {
          currentUser = currentUser.copyWith(
              fullName: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.image:
        {
          currentUser = currentUser.copyWith(
              image: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.phone:
        {
          currentUser = currentUser.copyWith(
              phone: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.userId:
        {
          currentUser = currentUser.copyWith(
              userId: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.createdAt:
        {
          currentUser = currentUser.copyWith(
              createdAt: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.password:
        {
          currentUser = currentUser.copyWith(
              password: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.email:
        {
          currentUser = currentUser.copyWith(
              email: updateCurrentUserEvent.value as String);
          break;
        }
    }
    debugPrint("User Model: ${currentUser.toString()}");
    emit(state.copyWith(userModel: currentUser));
  }
}
