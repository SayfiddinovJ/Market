part of 'category_bloc.dart';

@immutable
class CategoryState {
  const CategoryState({
    required this.categoryModel,
    required this.categories,
    required this.status,
    required this.statusMessage,
    required this.imageURL,
  });

  final CategoryModel categoryModel;
  final List<CategoryModel> categories;
  final FormStatus status;
  final String statusMessage;
  final String imageURL;

  CategoryState copyWith({
    String? statusMessage,
    CategoryModel? categoryModel,
    List<CategoryModel>? categories,
    FormStatus? status,
    String? imageURL,
  }) =>
      CategoryState(
        categoryModel: categoryModel ?? this.categoryModel,
        categories: categories ?? this.categories,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
        imageURL: imageURL?? this.imageURL,
      );

  String canAdd() {
    if (categoryModel.categoryName.isEmpty) return "Nomini kiriting";
    if (categoryModel.description.isEmpty) return "Tavsifni kiriting";
    if (categoryModel.imageUrl.isEmpty) return "Rasmni yuklang";
    return "";
  }

  @override
  String toString() {
    return '''
    Category: $categoryModel
    Categories: $categories
    Status: $status
    Status Text: $statusMessage
    ''';
  }
}
