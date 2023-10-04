import 'package:flutter/material.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/ui/admin/tabs_box_admin.dart';
import 'package:market/ui/auth/sign_in_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _navigate(context);
    return const Scaffold(
      body: Center(child: FlutterLogo()),
    );
  }

  _navigate(BuildContext context) async {
    String key = StorageRepository.getString('key');
    await Future.delayed(const Duration(seconds: 1));
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => key.isEmpty
              ? const SignInScreen()
              : key == 'admin'
                  ? const TabsBoxAdmin()
                  : const TabsBoxAdmin(),
        ),
      );
    }
  }
}
