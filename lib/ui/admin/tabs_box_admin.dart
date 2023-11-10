import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/cubits/tabs_box_cubit.dart';
import 'package:market/data/models/status.dart';
import 'package:market/ui/admin/category/category_screen.dart';
import 'package:market/ui/admin/home/home_screen.dart';
import 'package:market/ui/admin/profile/account_screen.dart';
import 'package:market/ui/auth/sign_in/sign_in_screen.dart';

class TabsBoxAdmin extends StatefulWidget {
  const TabsBoxAdmin({super.key});

  @override
  State<TabsBoxAdmin> createState() => _TabsBoxAdminState();
}

class _TabsBoxAdminState extends State<TabsBoxAdmin> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(const HomeScreenAdmin());
    screens.add(const CategoryScreenAdmin());
    screens.add(const AccountScreenAdmin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == FormStatus.unauthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          return IndexedStack(
            index: context.read<TabsBoxCubit>().state,
            children: screens,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: context.watch<TabsBoxCubit>().state,
        onTap: context.read<TabsBoxCubit>().setIndex,
      ),
    );
  }
}
