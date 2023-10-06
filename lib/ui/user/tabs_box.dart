import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/blocs/user_bloc/user_bloc.dart';
import 'package:market/cubits/auth_cubit/auth_cubit.dart';
import 'package:market/cubits/tabs_box_cubit.dart';
import 'package:market/data/models/status.dart';
import 'package:market/ui/auth/sign_in_screen.dart';
import 'package:market/ui/user/category/category_screen.dart';
import 'package:market/ui/user/products/products_screen.dart';
import 'package:market/ui/user/profile/profile_screen.dart';

class TabsBox extends StatefulWidget {
  const TabsBox({super.key});

  @override
  State<TabsBox> createState() => _TabsBoxState();
}

class _TabsBoxState extends State<TabsBox> {
  List<Widget> screens = [];

  init() {
    context.read<UserBloc>().add(GetUserEvent());
  }

  @override
  void initState() {
    init();
    screens.add(const ProductsScreen());
    screens.add(const CategoryScreen());
    screens.add(const ProfileScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Products'),
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
