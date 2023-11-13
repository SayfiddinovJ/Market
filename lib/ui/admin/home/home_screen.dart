import 'package:flutter/material.dart';
import 'package:market/ui/admin/home/sub_screens/admin_drawer.dart';
import 'package:market/ui/user/products/widgets/search_container.dart';
import 'package:market/ui/widgets/search.dart';

class HomeScreenAdmin extends StatelessWidget {
  const HomeScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AdminDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        title: SearchContainer(
          onTap: () {
            showSearch(context: context, delegate: ProductSearchDelegate([]));
          },
          text: 'Mahsulot Izlash',
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}
