import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/data/firebase/auth_service.dart';
import 'package:market/data/models/universal_data.dart';
import 'package:market/ui/auth/register_screen.dart';
import 'package:market/ui/widgets/global_button.dart';
import 'package:market/utils/size_extension.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
              text: 'Kirish',
              onTap: () async {
                await Firebase.initializeApp();
                AuthService authService = AuthService();
                UniversalData data = await authService.signUpUser(
                    email: 'example@gmail.com', password: 'password');
                debugPrint("""
               Data: ${data.data}
               Error ${data.error}
                """);
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
      ),
    );
  }
}
