class ProductModel {
  int count;
  int price;
  String image;
  String categoryId;
  String productId;
  String productName;
  String barcode;
  String description;
  String createdAt;

  ProductModel({
    required this.count,
    required this.price,
    required this.image,
    required this.categoryId,
    required this.productId,
    required this.productName,
    required this.barcode,
    required this.description,
    required this.createdAt,
  });

  ProductModel copyWith({
    int? count,
    int? price,
    String? image,
    String? categoryId,
    String? productId,
    String? productName,
    String? barcode,
    String? description,
    String? createdAt,
  }) {
    return ProductModel(
      count: count ?? this.count,
      price: price ?? this.price,
      image: image ?? this.image,
      categoryId: categoryId ?? this.categoryId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      barcode: barcode ?? this.barcode,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      count: jsonData['count'] as int? ?? 0,
      price: jsonData['price'] as int? ?? 0,
      image: jsonData['image'] as String? ?? '',
      categoryId: jsonData['categoryId'] as String? ?? '',
      productId: jsonData['productId'] as String? ?? '',
      productName: jsonData['productName'] as String? ?? '',
      barcode: jsonData['barcode'] as String? ?? '',
      description: jsonData['description'] as String? ?? '',
      createdAt: jsonData['createdAt'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'price': price,
      'image': image,
      'categoryId': categoryId,
      'productId': productId,
      'productName': productName,
      'barcode': barcode,
      'description': description,
      'createdAt': createdAt,
    };
  }

  @override
  String toString() {
    return '''
      count: $count,
      price: $price,
      image: $image,
      categoryId: $categoryId,
      productId: $productId,
      productName: $productName,
      barcode: $barcode,
      description: $description,
      createdAt: $createdAt
      ''';
  }
}
