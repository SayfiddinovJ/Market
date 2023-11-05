import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market/cubits/auth_cubit/auth_cubit.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/data/models/status.dart';
import 'package:market/ui/admin/tabs_box_admin.dart';
import 'package:market/ui/auth/register_screen.dart';
import 'package:market/ui/auth/widgets/google_button.dart';
import 'package:market/ui/auth/widgets/or.dart';
import 'package:market/ui/user/tabs_box.dart';
import 'package:market/ui/widgets/global_button.dart';
import 'package:market/ui/widgets/global_textfield.dart';
import 'package:market/utils/app_images/app_images.dart';
import 'package:market/utils/extensions/extensions.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPassword = false;
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
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
                    context.read<AuthCubit>().updateName(v);
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
                    context.read<AuthCubit>().updatePassword(v);
                  },
                ),
                16.ph,
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
                21.ph,
                const Or(),
                16.ph,
                GoogleButton(onTap: (){}),
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
