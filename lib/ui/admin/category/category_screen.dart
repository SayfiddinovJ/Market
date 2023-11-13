import 'package:flutter/material.dart';
import 'package:market/ui/user/products/widgets/search_container.dart';

class CategoryScreenAdmin extends StatelessWidget {
  const CategoryScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        title: SearchContainer(
          onTap: () {},
          text: 'Mahsulot Izlash',
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}
