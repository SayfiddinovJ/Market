import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/ui/widgets/zoom_tap_button.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapButton(
      onTap: onTap,
      child: Container(
        height: 56.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
