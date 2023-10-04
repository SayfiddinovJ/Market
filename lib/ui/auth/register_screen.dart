import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/ui/auth/sign_in_screen.dart';
import 'package:market/ui/widgets/global_button.dart';
import 'package:market/utils/size_extension.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            100.ph,
            const Text('Xush kelibsiz'),
            24.ph,
            const TextField(),
            24.ph,
            const TextField(),
            24.ph,
            GlobalButton(
              text: 'Ro\'yxatda o\'tish',
              onTap: () {},
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
                  'Ro\'yxatdan o\'tish',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
