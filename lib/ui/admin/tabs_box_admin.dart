import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/cubits/tabs_box_cubit.dart';
import 'package:market/ui/admin/category/category_screen.dart';
import 'package:market/ui/admin/home/home_screen.dart';

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
        ],
        currentIndex: context.watch<TabsBoxCubit>().state,
        onTap: context.read<TabsBoxCubit>().setIndex,
      ),
    );
  }
}
