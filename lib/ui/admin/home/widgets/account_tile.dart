import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/utils/extensions/extensions.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({
    super.key,
    required this.text,
    required this.iconData,
    required this.onTap,
  });

  final String text;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Icon(
              iconData,
              color: const Color(0xFF40BFFF),
              size: 25.w,
            ),
            16.pw,
            Text(
              text,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF223263),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
