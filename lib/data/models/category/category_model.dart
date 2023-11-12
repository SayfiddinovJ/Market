class CategoryModel {
  String categoryId;
  String categoryName;
  String description;
  String company;
  String imageUrl;
  String createdAt;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.description,
    required this.imageUrl,
    required this.company,
    required this.createdAt,
  });

  CategoryModel copyWith({
    String? categoryId,
    String? categoryName,
    String? description,
    String? imageUrl,
    String? company,
    String? createdAt,
  }) {
    return CategoryModel(
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      company: company ?? this.company,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      categoryId: jsonData['categoryId'] as String? ?? "",
      categoryName: jsonData['categoryName'] as String? ?? '',
      description: jsonData['description'] as String? ?? '',
      imageUrl: jsonData['imageUrl'] as String? ?? '',
      company: jsonData['company'] as String? ?? '',
      createdAt: jsonData['createdAt'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'categoryName': categoryName,
      'description': description,
      'imageUrl': imageUrl,
      'company': company,
      'createdAt': createdAt,
    };
  }

  @override
  String toString() {
    return ''''
       categoryId : $categoryId,
       categoryName : $categoryName,
       description : $description,
       imageUrl : $imageUrl,
       company : $company,
       createdAt : $createdAt, 
      ''';
  }
}