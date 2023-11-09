import 'package:flutter/material.dart';
import 'package:market/data/models/product/product_model.dart';

class ProductSearchDelegate extends SearchDelegate {
  final List<ProductModel> products;

  ProductSearchDelegate(this.products);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<ProductModel> searchResults = products
        .where((product) =>
            product.productName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final product = searchResults[index];
        return ListTile(
          title: Text(product.productName),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<ProductModel> searchResults = products
        .where((product) =>
            product.productName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final product = searchResults[index];
        return ListTile(
          title: Text(product.productName),
        );
      },
    );
  }
}
