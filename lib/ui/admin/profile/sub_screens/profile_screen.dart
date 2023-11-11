import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/bloc/auth_bloc/auth_event.dart';
import 'package:market/cubits/get_user_cubit/user_cubit.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/ui/user/profile/widgets/profile_tile.dart';
import 'package:market/ui/widgets/global_button.dart';
import 'package:market/utils/dialog/message_dialog.dart';
import 'package:market/utils/dialog/text_field_dialog.dart';
import 'package:market/utils/extensions/extensions.dart';

class ProfileScreenAdmin extends StatefulWidget {
  const ProfileScreenAdmin({super.key});

  @override
  State<ProfileScreenAdmin> createState() => _ProfileScreenAdminState();
}

class _ProfileScreenAdminState extends State<ProfileScreenAdmin> {
  _init() {
    BlocProvider.of<UserCubit>(context).fetchClientData();
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

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
        elevation: 1,
        title: Text(
          'Profil',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF223263),
          ),
        ),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is GetUserSuccess) {
            String company = StorageRepository.getString('company');
            return Column(
              children: [
                24.ph,
                ProfileTile(
                  name: state.user.fullName,
                  email: state.user.email,
                ),
                32.ph,
                const Divider(),
                InkWell(
                  onTap: () async {
                    if (company.isEmpty) {
                      await showTextFieldDialog(
                        message: 'Do\'koningiz nomini kiriting',
                        context: context,
                      );
                      setState(() {});
                    }
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.store,
                          color: const Color(0xFF40BFFF),
                          size: 24.w,
                        ),
                        22.pw,
                        Text(
                          "Do'kon nomi",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF223263),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          company.isNotEmpty ? company : 'Hech narsa',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9098B1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GlobalButton(
                    text: 'Chiqish',
                    onTap: () {
                      showConfirmMessage(
                        message: 'Haqiqatan ham tizimdan chiqmoqchimisiz?',
                        context: context,
                        onConfirm: () {
                          context.read<AuthBloc>().add(LogOutEvent());
                        },
                      );
                    },
                  ),
                ),
                10.ph,
              ],
            );
          }
          if (state is GetUserLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(
            child: Text('Ma\'lumotlarni o\'qishda xatolik yuz berdi'),
          );
        },
      ),
    );
  }
}
