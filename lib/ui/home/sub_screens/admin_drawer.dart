import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/cubits/drawer_cubit.dart';
import 'package:market/ui/widgets/drawer_tile.dart';
import 'package:market/utils/extensions/extensions.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, int>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Drawer(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                34.ph,
                Row(
                  children: [
                    12.pw,
                    Text(
                      "SSL-Market",
                      style: TextStyle(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF212121),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        size: 20.w,
                        color: const Color(0xFF424242),
                      ),
                    ),
                  ],
                ),
                40.ph,
                DrawerTile(
                  iconData: Icons.home_outlined,
                  text: 'Asosiy',
                  isActive: state == 0,
                  onTap: () {
                    context.read<DrawerCubit>().changeIndex(0);
                  },
                ),DrawerTile(
                  iconData: Icons.category_outlined,
                  text: 'Kategoriya qo\'shish',
                  isActive: state == 1,
                  onTap: () {
                    context.read<DrawerCubit>().changeIndex(1);
                  },
                ),
                DrawerTile(
                  iconData: Icons.shopping_bag_outlined,
                  text: 'Mahsulot qo\'shish',
                  isActive: state == 2,
                  onTap: () {
                    context.read<DrawerCubit>().changeIndex(2);
                  },
                ),
                DrawerTile(
                  iconData: Icons.book_outlined,
                  text: 'Qarzdorlar ro\'yhati',
                  isActive: state == 3,
                  onTap: () {
                    context.read<DrawerCubit>().changeIndex(3);
                  },
                ),
                DrawerTile(
                  iconData: Icons.monetization_on_outlined,
                  text: 'Qarz qo\'shish',
                  isActive: state == 4,
                  onTap: () {
                    context.read<DrawerCubit>().changeIndex(4);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
