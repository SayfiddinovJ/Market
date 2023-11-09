import 'package:market/data/firebase/category_service.dart';
import 'package:market/data/models/category/category_model.dart';
import 'package:market/data/models/universal_data.dart';

class CategoryRepository {
  final CategoryService categoryService;

  CategoryRepository({required this.categoryService});

  Future<UniversalData> getCategories() => categoryService.getCategories();

  Future<UniversalData> addCategory(CategoryModel categoryModel) =>
      categoryService.addCategory(categoryModel: categoryModel);

  Future<UniversalData> updateCategory(CategoryModel categoryModel) =>
      categoryService.updateCategory(categoryModel: categoryModel);

  Future<UniversalData> deleteCategory(String categoryId) =>
      categoryService.deleteCategory(categoryId: categoryId);
}
