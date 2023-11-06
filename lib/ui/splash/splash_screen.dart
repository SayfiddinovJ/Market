import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/ui/app/app.dart';
import 'package:market/ui/auth/sign_in/sign_in_screen.dart';
import 'package:market/utils/app_images/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _navigate(context);
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
  }

  _navigate(BuildContext context) async {
    String key = StorageRepository.getString('key');
    debugPrint('key: $key');
    await Future.delayed(const Duration(seconds: 1));
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              key.isEmpty ? const SignInScreen() : const App(),
        ),
      );
    }
  }
}
