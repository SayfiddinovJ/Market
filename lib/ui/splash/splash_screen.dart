import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/ui/home/home_screen.dart';
import 'package:market/utils/app_images/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _go(context);
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
            'SSL Market',
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

  _go(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (context.mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      },
    );
  }
}
