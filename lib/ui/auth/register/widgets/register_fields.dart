import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/bloc/auth_bloc/auth_event.dart';
import 'package:market/data/models/user/user_model_fields.dart';
import 'package:market/ui/auth/sign_in/sign_in_screen.dart';
import 'package:market/ui/widgets/global_button.dart';
import 'package:market/ui/widgets/global_textfield.dart';
import 'package:market/utils/app_images/app_images.dart';
import 'package:market/utils/extensions/extensions.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({super.key});

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  bool isPassword = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          100.ph,
          Center(
            child: Image.asset(
              AppImages.logo,
              height: 90.w,
              width: 90.w,
            ),
          ),
          16.ph,
          Center(
            child: Text(
              'Qani boshladik',
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
              'Yangi hisob yarating',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: const Color(0xFF9098B1),
              ),
            ),
          ),
          28.ph,
          GlobalTextField(
            prefixIcon: const Icon(Icons.person_outlined),
            hintText: 'Ism',
            controller: nameController,
            onChanged: (v) {
              context.read<AuthBloc>().add(UpdateCurrentUserEvent(
                  fieldKey: UserFieldKeys.name, value: v));
            },
          ),
          8.ph,
          GlobalTextField(
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.email_outlined),
            hintText: 'Email',
            controller: emailController,
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
            controller: passwordController,
            onChanged: (v) {
              context.read<AuthBloc>().add(UpdateCurrentUserEvent(
                  fieldKey: UserFieldKeys.password, value: v));
            },
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
          ),
          16.ph,
          GlobalButton(
            text: 'Ro\'yxatda o\'tish',
            onTap: () {
              String canAuth = context.read<AuthBloc>().canRegister();
              if (canAuth.isEmpty) {
                context.read<AuthBloc>().add(RegisterEvent());
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
                context.read<AuthBloc>().add(ClearEvent());
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
              child: const Text(
                'Tizimga kirish',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
