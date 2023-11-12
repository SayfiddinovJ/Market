import 'package:flutter/material.dart';
import 'package:market/ui/user/products/sub_screens/drawer_screen.dart';
import 'package:market/ui/user/products/widgets/search_container.dart';
import 'package:market/ui/widgets/search.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const UserDrawerScreen(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        elevation: 1,
        title: SearchContainer(
          onTap: () {
            showSearch(context: context, delegate: ProductSearchDelegate([]));
          }, text: 'Mahsulot Izlash',
        ),
      ),
    );
  }
}
