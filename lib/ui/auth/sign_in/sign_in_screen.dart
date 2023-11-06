import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/data/models/status.dart';
import 'package:market/ui/admin/tabs_box_admin.dart';
import 'package:market/ui/auth/sign_in/widgets/sign_in_fields.dart';
import 'package:market/ui/user/tabs_box.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return const SignInFields();
        },
        listener: (context, state) {
          String token = StorageRepository.getString('token');
          if (state.status == FormStatus.authenticated) {
            Fluttertoast.showToast(msg: 'OMPga Marketga xush kelibsiz');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    token == 'admin' ? const TabsBoxAdmin() : const TabsBox(),
              ),
            );
          }
          if (state.status == FormStatus.failure) {
            Fluttertoast.showToast(msg: 'Siz hali ro\'yxatdan o\'magansiz');
          }
        },
      ),
    );
  }
}