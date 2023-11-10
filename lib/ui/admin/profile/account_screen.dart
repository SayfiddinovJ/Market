import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/ui/admin/profile/sub_screens/profile/profile_screen.dart';
import 'package:market/ui/admin/profile/widgets/account_tile.dart';

class AccountScreenAdmin extends StatefulWidget {
  const AccountScreenAdmin({super.key});

  @override
  State<AccountScreenAdmin> createState() => _AccountScreenAdminState();
}

class _AccountScreenAdminState extends State<AccountScreenAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Hisob',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF223263),
          ),
        ),
      ),
      body: Column(
        children: [
          AccountTile(
            text: 'Profil',
            iconData: Icons.account_circle,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreenAdmin(),
                ),
              );
            },
          ),
          AccountTile(
            text: 'Kategoriya qo\'shish',
            iconData: Icons.add_circle,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreenAdmin(),
                ),
              );
            },
          ),
          AccountTile(
            text: 'Mahsulot qo\'shish',
            iconData: Icons.add_circle,
            onTap: () {
              String company = StorageRepository.getString('company');
              if (company.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreenAdmin(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
