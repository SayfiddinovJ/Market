import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market/cubits/auth_cubit/auth_cubit.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/data/models/status.dart';
import 'package:market/ui/admin/tabs_box_admin.dart';
import 'package:market/ui/auth/register_screen.dart';
import 'package:market/ui/user/tabs_box.dart';
import 'package:market/ui/widgets/global_button.dart';
import 'package:market/ui/widgets/global_textfield.dart';
import 'package:market/utils/extensions/extensions.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          // if (state.status == FormStatus.loading) {
          //   return const Center(child: CircularProgressIndicator());
          // }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                170.ph,
                Text(
                  'Do\'konga kirish',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
                70.ph,
                GlobalTextField(
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Ism',
                  onChanged: (v) {
                    context.read<AuthCubit>().updateName(v);
                  },
                ),
                24.ph,
                GlobalTextField(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Parol',
                  obscureText: isPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    icon: Icon(
                      isPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  onChanged: (v) {
                    context.read<AuthCubit>().updatePassword(v);
                  },
                ),
                40.ph,
                GlobalButton(
                  text: 'Kirish',
                  onTap: () {
                    String canAuth =
                        context.read<AuthCubit>().canAuthenticate();
                    if (canAuth.isEmpty) {
                      context.read<AuthCubit>().logIn(context);
                    } else {
                      Fluttertoast.showToast(msg: canAuth);
                    }
                  },
                ),
                30.ph,
                const Center(child: Text('yoki')),
                24.ph,
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Ro\'yxatdan o\'tish',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          String token = StorageRepository.getString('token');
          if (state.status == FormStatus.authenticated) {
            Fluttertoast.showToast(msg: 'SSL Marketga xush kelibsiz');
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