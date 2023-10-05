import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/cubits/auth_cubit/auth_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile User'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().logOutUser(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}