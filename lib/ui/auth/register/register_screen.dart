import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/data/models/status.dart';
import 'package:market/ui/admin/tabs_box_admin.dart';
import 'package:market/ui/auth/register/widgets/register_fields.dart';
import 'package:market/ui/user/tabs_box.dart';
import 'package:market/utils/dialog/circular_dialog.dart';

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
          String role = StorageRepository.getString('role');
          if (state.status == FormStatus.authenticated) {
            hideLoading(context: context);
            Fluttertoast.showToast(msg: 'SSL Marketga xush kelibsiz');
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    role == 'admin' ? const TabsBoxAdmin() : const TabsBox(),
              ),
              (route) => false,
            );
          }
          if (state.status == FormStatus.failure) {
            Fluttertoast.showToast(msg: 'Siz ro\'yxatdan o\'tgansiz');
            hideLoading(context: context);
          }
          if (state.status == FormStatus.loading) {
            showLoading(context: context);
          }
          if (state.status == FormStatus.success) {
            hideLoading(context: context);
          }
          if (state.status == FormStatus.unauthenticated) {
            hideLoading(context: context);
          }
        },
      ),
    );
  }
}
