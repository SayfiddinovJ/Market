import 'package:flutter/material.dart';
import 'package:market/ui/user/products/widgets/search_container.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const SearchContainer()),
    );
  }
}
