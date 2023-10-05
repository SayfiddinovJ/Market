import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/ui/app/app.dart';
import 'package:market/ui/auth/sign_in_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _navigate(context);
    return  Scaffold(
      body: Center(child: FlutterLogo(size: 100.w)),
    );
  }

  _navigate(BuildContext context) async {
    String key = StorageRepository.getString('token');
    await Future.delayed(const Duration(seconds: 1));
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => key.isEmpty
              ? const SignInScreen()
              : const App(),
        ),
      );
    }
  }
}
