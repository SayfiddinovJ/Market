import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/cubits/auth_cubit/auth_cubit.dart';
import 'package:market/data/local/storage_repository.dart';

class ProfileScreenAdmin extends StatelessWidget {
  const ProfileScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Admin'),
        actions: [
          IconButton(
            onPressed: () async {
              context.read<AuthCubit>().logOutUser(context);
              await StorageRepository.deleteString('user_id');
            },
            icon: const Icon(Icons.logout, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
