import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.path, required this.onTap});

  final String path;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: path.isEmpty ? 100.h : MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: Colors.blue,
              width: 1.w,
            ),
          ),
          child: path.isNotEmpty
              ? Image.file(File(path), fit: BoxFit.cover)
              : const Icon(Icons.image_outlined, size: 30),
        ),
      ),
    );
  }
}
