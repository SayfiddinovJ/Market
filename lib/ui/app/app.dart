import 'package:flutter/material.dart';
import 'package:market/ui/admin/tabs_box_admin.dart';
import 'package:market/ui/user/tabs_box.dart';

class App extends StatelessWidget {
  const App({super.key, required this.role});

  final String role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: role == 'admin' ? const TabsBoxAdmin() : const TabsBox(),
    );
  }
}
