class ProductModel {
  int count;
  int price;
  List<dynamic> productImages;
  String categoryId;
  String productId;
  String productName;
  String description;
  String createdAt;

  ProductModel({
    required this.count,
    required this.price,
    required this.productImages,
    required this.categoryId,
    required this.productId,
    required this.productName,
    required this.description,
    required this.createdAt,
  });

  ProductModel copyWith({
    int? count,
    int? price,
    List<dynamic>? productImages,
    String? categoryId,
    String? productId,
    String? productName,
    String? description,
    String? createdAt,
  }) {
    return ProductModel(
      count: count ?? this.count,
      price: price ?? this.price,
      productImages: productImages ?? this.productImages,
      categoryId: categoryId ?? this.categoryId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      count: jsonData['count'] as int? ?? 0,
      price: jsonData['price'] as int? ?? 0,
      productImages: (jsonData['productImages'] as List<dynamic>? ?? []),
      categoryId: jsonData['categoryId'] as String? ?? '',
      productId: jsonData['productId'] as String? ?? '',
      productName: jsonData['productName'] as String? ?? '',
      description: jsonData['description'] as String? ?? '',
      createdAt: jsonData['createdAt'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'price': price,
      'productImages': productImages,
      'categoryId': categoryId,
      'productId': productId,
      'productName': productName,
      'description': description,
      'createdAt': createdAt,
    };
  }

  @override
  String toString() {
    return '''
      count: $count,
      price: $price,
      productImages: $productImages,
      categoryId: $categoryId,
      productId: $productId,
      productName: $productName,
      description: $description,
      createdAt: $createdAt
      ''';
  }
}
