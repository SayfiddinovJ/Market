import 'package:market/data/firebase/category_service.dart';
import 'package:market/data/models/universal_data.dart';

class CategoryRepository {
  final CategoryService categoryService;

  CategoryRepository({required this.categoryService});

  // Future<UniversalData> getCategories() => categoryService.getCategories();
}
