import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/bloc/category/category_bloc.dart';
import 'package:market/data/models/category/category_model_fields.dart';
import 'package:market/ui/home/sub_screens/admin_drawer.dart';
import 'package:market/ui/widgets/global_button.dart';
import 'package:market/ui/widgets/global_textfield.dart';
import 'package:market/ui/widgets/image_container.dart';
import 'package:market/utils/extensions/extensions.dart';

class CategoryAddScreen extends StatefulWidget {
  const CategoryAddScreen({super.key});

  @override
  State<CategoryAddScreen> createState() => _CategoryAddScreenState();
}

class _CategoryAddScreenState extends State<CategoryAddScreen> {
  String path = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AdminDrawer(),
      drawerScrimColor: Colors.blue,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
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
                Text(
                  "Kategoriya rasmi",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF223263),
                  ),
                ),
                12.ph,
                ImageContainer(
                  path: path,
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: GlobalButton(
              text: 'Qo\'shish',
              onTap: () {},
            ),
          ),
          16.ph,
        ],
      ),
    );
  }
}
