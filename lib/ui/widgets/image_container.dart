import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.path, required this.onTap});

  final String path;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: Colors.black,
            width: 1.w,
          ),
        ),
        child: path.isNotEmpty
            ? Image.file(File(path), fit: BoxFit.cover)
            : const Icon(Icons.image_outlined, size: 30),
      ),
    );
  }
}
