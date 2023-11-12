import 'package:flutter/material.dart';
import 'package:market/ui/user/products/widgets/search_container.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        elevation: 1,
        title: SearchContainer(
          onTap: () {},
          text: 'Kategoriya Izlash',
        ),
      ),
    );
  }
}
