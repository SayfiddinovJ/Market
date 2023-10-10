import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/blocs/user_bloc/user_bloc.dart';
import 'package:market/cubits/auth_cubit/auth_cubit.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/data/models/user/user_model.dart';

class ProfileScreenAdmin extends StatelessWidget {
  const ProfileScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Admin'),
        actions: [
          IconButton(
            onPressed: () async {
              context.read<AuthCubit>().logOutUser(context);
              await StorageRepository.deleteString('user_id');
            },
            icon: const Icon(Icons.logout, color: Colors.red),
          ),
        ],
      ),
      body: BlocConsumer<UserBloc, UsersState>(
        builder: (context, state) {
          UserModel user = state.userModel;
          return Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.network(
                      user.image,
                      errorBuilder: (context, o, s) => Icon(
                        Icons.person,
                        size: 100.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  user.fullName,
                  style:
                  TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.h),
                Text(
                  '+998 ${user.phone}',
                  style: TextStyle(fontSize: 18.sp),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
