import 'package:market/data/firebase/product_service.dart';
import 'package:market/data/models/product/product_model.dart';
import 'package:market/data/models/universal_data.dart';

class ProductRepository {
  final ProductService productService;

  ProductRepository({required this.productService});

  Future<UniversalData> getProducts() => productService.getProducts();

  Future<UniversalData> addProduct(ProductModel productModel) =>
      productService.addProduct(productModel: productModel);

  Future<UniversalData> updateProduct(ProductModel productModel) =>
      productService.updateProduct(productModel: productModel);

  Future<UniversalData> deleteProduct(String productId) =>
      productService.deleteProduct(productId: productId);
}
