import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/data/models/product/product_model.dart';
import 'package:market/data/models/universal_data.dart';

class ProductService {
  static Future<UniversalData> addProduct(
      {required ProductModel productModel}) async {
    try {
      String company = StorageRepository.getString('company');
      DocumentReference newProduct = await FirebaseFirestore.instance
          .collection("${company}products")
          .add(productModel.toJson());

      await FirebaseFirestore.instance
          .collection("${company}products")
          .doc(newProduct.id)
          .update({
        "productId": newProduct.id,
      });

      return UniversalData(data: "Product added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  static Future<UniversalData> updateProduct(
      {required ProductModel productModel}) async {
    try {
      String company = StorageRepository.getString('company');
      await FirebaseFirestore.instance
          .collection("${company}products")
          .doc(productModel.productId)
          .update(productModel.toJson());

      return UniversalData(data: "Product updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  static Future<UniversalData> deleteProduct(
      {required String productId}) async {
    try {
      String company = StorageRepository.getString('company');
      await FirebaseFirestore.instance
          .collection("${company}products")
          .doc(productId)
          .delete();

      return UniversalData(data: "Product deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  // Future<UniversalData> getAllProducts() async {
  //   try {
  //     String company = StorageRepository.getString('company');
  //     final querySnapshot =
  //     await FirebaseFirestore.instance.collection('products').get();
  //
  //     List<Product> products = [];
  //
  //     for (var document in querySnapshot.docs) {
  //       products.add(Product.fromJson(document.data()));
  //     }
  //
  //     return products;
  //   } on FirebaseException catch (e) {
  //     // Handle Firebase exceptions
  //     print('FirebaseException: $e');
  //     return [];
  //   } catch (e) {
  //     // Handle other exceptions
  //     print('Error: $e');
  //     return [];
  //   }
  // }

}
