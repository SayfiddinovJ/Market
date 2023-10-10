import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/blocs/user_bloc/user_bloc.dart';
import 'package:market/cubits/tabs_box_cubit.dart';
import 'package:market/ui/admin/add/add_screen.dart';
import 'package:market/ui/admin/category/category_screen.dart';
import 'package:market/ui/admin/home/home_screen.dart';
import 'package:market/ui/admin/profile/profile_screen.dart';

class TabsBoxAdmin extends StatefulWidget {
  const TabsBoxAdmin({super.key});

  @override
  State<TabsBoxAdmin> createState() => _TabsBoxAdminState();
}

class _TabsBoxAdminState extends State<TabsBoxAdmin> {
  List<Widget> screens = [];

  init() {
    context.read<UserBloc>().add(GetUserEvent());
  }

  @override
  void initState() {
    init();
    screens.add(const HomeScreenAdmin());
    screens.add(const CategoryScreenAdmin());
    screens.add(const AddScreenAdmin());
    screens.add(const ProfileScreenAdmin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.read<TabsBoxCubit>().state,
        children: screens,
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
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: context.watch<TabsBoxCubit>().state,
        onTap: context.read<TabsBoxCubit>().setIndex,
      ),
    );
  }
}
