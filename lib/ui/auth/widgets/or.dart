import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/utils/extensions/extensions.dart';

class Or extends StatelessWidget {
  const Or({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFFEBF0FF),
          ),
        ),
        23.pw,
        Text(
          'yoki',
          style: TextStyle(
            color: const Color(0xFF9098B1),
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        23.pw,
        const Expanded(
          child: Divider(
            color: Color(0xFFEBF0FF),
          ),
        ),
      ],
    );
  }
}
