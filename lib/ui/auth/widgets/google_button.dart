import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/utils/app_images/app_images.dart';
import 'package:market/utils/extensions/extensions.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5.r),
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: const Color(0xFFEBF0FF), width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.google,
              height: 30.w,
              width: 30.w,
            ),
            10.pw,
            Text(
              'Google bilan kirish',
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xFF9098B1),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
