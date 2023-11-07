import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/cubits/get_user_cubit/user_cubit.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/ui/app/app.dart';
import 'package:market/ui/auth/sign_in/sign_in_screen.dart';
import 'package:market/utils/app_images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() {
    BlocProvider.of<UserCubit>(context).fetchClientData();
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  AppImages.logo,
                  height: 150.w,
                  width: 150.w,
                ),
              ),
              Text(
                'Open Market Place',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: const Color(0xFF223263),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is GetUserSuccess) {
          String key = StorageRepository.getString('key');
          debugPrint('Key: $key');
          debugPrint('Role: ${state.user.role}');
          if (context.mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => key.isEmpty
                    ? const SignInScreen()
                    : App(role: state.user.role),
              ),
            );
          }
        }
        if (state is GetUserError) {
          debugPrint('ERROR');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
          );
        }
        if (state is GetUserLoading) {
          debugPrint('LOADING');
        }
      },
      buildWhen: (previous, current) => previous != current,
    );
  }
}
