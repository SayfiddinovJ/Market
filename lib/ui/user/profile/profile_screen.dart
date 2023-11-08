import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/bloc/auth_bloc/auth_event.dart';
import 'package:market/cubits/get_user_cubit/user_cubit.dart';
import 'package:market/ui/user/profile/widgets/profile_tile.dart';
import 'package:market/ui/widgets/global_button.dart';
import 'package:market/utils/dialog/message_dialog.dart';
import 'package:market/utils/extensions/extensions.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            return Column(
              children: [
                24.ph,
                ProfileTile(
                  name: state.user.fullName,
                  email: state.user.email,
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
          return const Center(child: Text('Nothing'));
        },
      ),
    );
  }
}
