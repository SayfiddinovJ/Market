import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/repositories/auth_repository.dart';
import 'package:market/ui/admin/tabs_box_admin.dart';
import 'package:market/ui/auth/sign_in/sign_in_screen.dart';
import 'package:market/ui/user/tabs_box.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: context.read<AuthRepository>().listenAuthState(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.data == null) {
            return const SignInScreen();
          } else {
            String key = StorageRepository.getString('token');
            return key == 'admin' ? const TabsBoxAdmin() : const TabsBox();
          }
        },
      ),
    );
  }
}
