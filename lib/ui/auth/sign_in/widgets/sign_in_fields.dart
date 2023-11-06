import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/bloc/auth_bloc/auth_event.dart';
import 'package:market/data/models/user/user_model_fields.dart';
import 'package:market/ui/auth/register/register_screen.dart';
import 'package:market/ui/auth/widgets/google_button.dart';
import 'package:market/ui/auth/widgets/or.dart';
import 'package:market/ui/widgets/global_button.dart';
import 'package:market/ui/widgets/global_textfield.dart';
import 'package:market/utils/app_images/app_images.dart';
import 'package:market/utils/extensions/extensions.dart';

class SignInFields extends StatefulWidget {
  const SignInFields({super.key});

  @override
  State<SignInFields> createState() => _SignInFieldsState();
}

class _SignInFieldsState extends State<SignInFields> {
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          120.ph,
          Center(
            child: Image.asset(
              AppImages.logo,
              height: 100.w,
              width: 100.w,
            ),
          ),
          16.ph,
          Center(
            child: Text(
              'OMPga Xush kelibsiz',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: const Color(0xFF223263),
              ),
            ),
          ),
          8.ph,
          Center(
            child: Text(
              'Davom etish uchun tizimga kiring',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: const Color(0xFF9098B1),
              ),
            ),
          ),
          28.ph,
          GlobalTextField(
            prefixIcon: const Icon(Icons.email_outlined),
            hintText: 'Email',
            onChanged: (v) {
              context.read<AuthBloc>().add(UpdateCurrentUserEvent(
                  fieldKey: UserFieldKeys.email, value: v));
            },
          ),
          8.ph,
          GlobalTextField(
            prefixIcon: const Icon(Icons.lock_outline),
            hintText: 'Parol',
            obscureText: isPassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
              icon: Icon(
                isPassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            onChanged: (v) {
              context.read<AuthBloc>().add(UpdateCurrentUserEvent(
                  fieldKey: UserFieldKeys.password, value: v));
            },
          ),
          16.ph,
          GlobalButton(
            text: 'Tizimga kirish',
            onTap: () {
              String canAuth = context.read<AuthBloc>().canLogIn();
              if (canAuth.isEmpty) {
                context.read<AuthBloc>().add(LogInEvent());
              } else {
                Fluttertoast.showToast(msg: canAuth);
              }
            },
          ),
          21.ph,
          const Or(),
          16.ph,
          GoogleButton(onTap: () {}),
          16.ph,
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
  }
}
