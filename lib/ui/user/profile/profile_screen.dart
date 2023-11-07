import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/bloc/auth_bloc/auth_event.dart';
import 'package:market/utils/dialog/message_dialog.dart';

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
              showConfirmMessage(
                message: 'Haqiqatan ham tizimdan chiqmoqchimisiz?',
                context: context,
                onConfirm: () {
                  context.read<AuthBloc>().add(LogOutEvent());
                },
              );
            },
            icon: const Icon(Icons.logout, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
