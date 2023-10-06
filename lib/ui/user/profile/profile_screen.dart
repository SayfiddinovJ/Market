import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/blocs/user_bloc/user_bloc.dart';
import 'package:market/cubits/auth_cubit/auth_cubit.dart';
import 'package:market/data/local/storage_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile User'),
        actions: [
          IconButton(
            onPressed: () async {
              context.read<AuthCubit>().logOutUser(context);
              await StorageRepository.deleteString('user_id');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocConsumer<UserBloc, UsersState>(
        builder: (context, state) {
          return Center(
            child: Text('Full name ${state.userModel.fullName}'),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
