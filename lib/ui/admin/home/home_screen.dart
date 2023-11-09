import 'package:flutter/material.dart';
import 'package:market/ui/user/products/widgets/search_container.dart';
import 'package:market/ui/widgets/search.dart';

class HomeScreenAdmin extends StatelessWidget {
  const HomeScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: SearchContainer(
          onTap: () {
            showSearch(context: context, delegate: ProductSearchDelegate([]));
          },
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}
