import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/ui/admin/home/sub_screens/category_add_screen.dart';
import 'package:market/ui/admin/home/sub_screens/product_add_screen.dart';
import 'package:market/ui/admin/home/sub_screens/profile_screen.dart';
import 'package:market/ui/user/products/widgets/drawer_list_tile.dart';
import 'package:market/utils/app_images/app_images.dart';
import 'package:market/utils/extensions/extensions.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            10.ph,
            Center(child: Image.asset(AppImages.logo, width: 70.w)),
            Text(
              'Market',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF223263),
              ),
            ),
            DrawerListTile(
              iconData: Icons.account_circle,
              text: 'Profil',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreenAdmin(),
                  ),
                );
              },
            ),
            DrawerListTile(
              iconData: Icons.add_circle,
              text: 'Kategoriya qo\'shish',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoryAddScreen(),
                  ),
                );
              },
            ),
            DrawerListTile(
              iconData: Icons.add_circle,
              text: 'Mahsulot qo\'shish',
              onTap: () {
                List<String> categories =
                    StorageRepository.getList('categories');
                if (categories.isNotEmpty) {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductAddScreen(),
                    ),
                  );
                } else {
                  Fluttertoast.showToast(msg: 'Avval kategoriya qo\'shing');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
