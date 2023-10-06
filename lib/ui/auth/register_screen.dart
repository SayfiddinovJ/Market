import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market/blocs/user_bloc/user_bloc.dart';
import 'package:market/cubits/auth_cubit/auth_cubit.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/data/models/status.dart';
import 'package:market/data/models/user/user_model.dart';
import 'package:market/ui/admin/tabs_box_admin.dart';
import 'package:market/ui/auth/sign_in_screen.dart';
import 'package:market/ui/user/tabs_box.dart';
import 'package:market/ui/widgets/global_textfield.dart';
import 'package:market/ui/widgets/global_button.dart';
import 'package:market/utils/extensions/extensions.dart';
import 'package:market/utils/formaters/phone_number_formatter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPassword = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                120.ph,
                Text(
                  'Ro\'yxatdan o\'tish',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
                70.ph,
                GlobalTextField(
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Ism',
                  controller: nameController,
                  onChanged: (v) {
                    context.read<AuthCubit>().updateName(v);
                  },
                ),
                24.ph,
                GlobalTextField(
                  keyboardType: TextInputType.phone,
                  textFormatter: CustomTextInputFormatter(),
                  prefixIcon: const Icon(Icons.phone),
                  hintText: 'Telefon',
                  controller: phoneController,
                  onChanged: (v) {
                    context.read<AuthCubit>().updatePhone(v);
                  },
                ),
                24.ph,
                GlobalTextField(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Parol',
                  obscureText: isPassword,
                  controller: passwordController,
                  onChanged: (v) {
                    context.read<AuthCubit>().updatePassword(v);
                  },
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
                ),
                40.ph,
                GlobalButton(
                  text: 'Ro\'yxatda o\'tish',
                  onTap: () {
                    String canAuth = context.read<AuthCubit>().canRegister();
                    if (canAuth.isEmpty) {
                      context.read<AuthCubit>().signUp(context);
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
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Kirish',
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
            context.read<UserBloc>().add(
                  AddUserEvent(
                    userModel: UserModel(
                      image: '',
                      fullName: nameController.text,
                      email: '${nameController.text}@gmail.com',
                      phone: phoneController.text,
                      createdAt: DateTime.now().toString(),
                      userId: '',
                      password: passwordController.text,
                    ),
                  ),
                );
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
            Fluttertoast.showToast(msg: 'Xatolik yuz berdi');
          }
        },
      ),
    );
  }
}
