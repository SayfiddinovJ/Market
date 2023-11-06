import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/bloc/auth_bloc/auth_event.dart';

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
              context.read<AuthBloc>().add(LogOutEvent());
            },
            icon: const Icon(Icons.logout, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
