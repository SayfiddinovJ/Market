part of 'category_bloc.dart';

@immutable
class CategoryState {
  const CategoryState({
    required this.categoryModel,
    required this.categories,
    required this.status,
    required this.statusMessage,
  });

  final CategoryModel categoryModel;
  final List<CategoryModel> categories;
  final FormStatus status;
  final String statusMessage;

  CategoryState copyWith({
    String? statusMessage,
    CategoryModel? categoryModel,
    List<CategoryModel>? categories,
    FormStatus? status,
  }) =>
      CategoryState(
        categoryModel: categoryModel ?? this.categoryModel,
        categories: categories ?? this.categories,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
      );

  String canAdd() {
    if (categoryModel.imageUrl.isEmpty) return "Rasmni yuklang";
    if (categoryModel.categoryName.isEmpty) return "Nomini kiriting";
    if (categoryModel.description.isEmpty) return "Tavsifni kiriting";
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
