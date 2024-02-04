import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/utils/extensions/extensions.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.iconData,
    required this.text,
    required this.isActive,
    required this.onTap,
  });

  final IconData iconData;
  final String text;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6.r),
        child: Container(
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFE3F2FD) : null,
            borderRadius: BorderRadius.circular(6.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Row(
            children: [
              Icon(
                iconData,
                size: 24.w,
                color: Color(isActive ? 0xFF1E88E5 : 0xFF424242),
              ),
              12.pw,
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(isActive ? 0xFF1E88E5 : 0xFF424242),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
