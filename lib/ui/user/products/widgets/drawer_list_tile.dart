import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.iconData,
    required this.text,
    required this.onTap,
  });

  final IconData iconData;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.blue,
        size: 24.w,
      ),
      title: Text(text),
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF223263),
      ),
      onTap: onTap
    );
  }
}
