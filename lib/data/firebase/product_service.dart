import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/data/models/product/product_model.dart';
import 'package:market/data/models/universal_data.dart';

class ProductService {
  Future<UniversalData> addProduct({required ProductModel productModel}) async {
    try {
      DocumentReference newProduct = await FirebaseFirestore.instance
          .collection("products")
          .add(productModel.toJson());

      await FirebaseFirestore.instance
          .collection("products")
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

  Future<UniversalData> updateProduct(
      {required ProductModel productModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection("products")
          .doc(productModel.productId)
          .update(productModel.toJson());

      return UniversalData(data: "Product updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteProduct({required String productId}) async {
    try {
      await FirebaseFirestore.instance
          .collection("products")
          .doc(productId)
          .delete();

      return UniversalData(data: "Product deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getProducts() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();

      return UniversalData(data: querySnapshot);
    } on FirebaseException catch (e) {
      return UniversalData(error: e.toString());
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }
}
