import 'package:flutter/material.dart';
import 'package:market/ui/home/sub_screens/admin_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AdminDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        // title: SearchContainer(
        //   onTap: () {
        //     showSearch(context: context, delegate: ProductSearchDelegate([]));
        //   },
        //   text: 'Mahsulot Izlash',
        // ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}
