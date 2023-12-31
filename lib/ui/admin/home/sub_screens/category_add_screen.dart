import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/bloc/category/category_bloc.dart';
import 'package:market/data/models/category/category_model_fields.dart';
import 'package:market/ui/widgets/global_textfield.dart';
import 'package:market/utils/extensions/extensions.dart';

class CategoryAddScreen extends StatelessWidget {
  const CategoryAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF9098B1),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Kategoriya qo\'shish',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF223263),
          ),
        ),
        elevation: 1,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        physics: const BouncingScrollPhysics(),
        children: [
          16.ph,
          Text(
            "Kategoriya nomi",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF223263),
            ),
          ),
          12.ph,
          GlobalTextField(
            hintText: 'Kategoriya nomi',
            onChanged: (v) => context.read<CategoryBloc>().add(
                  UpdateCurrentCategory(
                    value: v,
                    fieldKeys: CategoryFieldKeys.categoryName,
                  ),
                ),
          ),
          24.ph,
          Text(
            "Kategoriya haqida",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF223263),
            ),
          ),
          12.ph,
          GlobalTextField(
            hintText: 'Kategoriya haqida',
            onChanged: (v) => context.read<CategoryBloc>().add(
                  UpdateCurrentCategory(
                    value: v,
                    fieldKeys: CategoryFieldKeys.description,
                  ),
                ),
          ),
          24.ph,
        ],
      ),
    );
  }
}
