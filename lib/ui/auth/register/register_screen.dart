import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/data/models/status.dart';
import 'package:market/ui/admin/tabs_box_admin.dart';
import 'package:market/ui/auth/register/widgets/register_fields.dart';
import 'package:market/ui/user/tabs_box.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return const RegisterFields();
        },
        listener: (context, state) {
          String token = StorageRepository.getString('token');
          if (state.status == FormStatus.authenticated) {
            Fluttertoast.showToast(msg: 'OMPga xush kelibsiz');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    token == 'admin' ? const TabsBoxAdmin() : const TabsBox(),
              ),
            );
          }
          if (state.status == FormStatus.failure) {
            Fluttertoast.showToast(msg: 'Siz ro\'yxatdan o\'tgansiz');
          }
        },
      ),
    );
  }
}
