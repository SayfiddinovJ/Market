part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class GetCategories extends CategoryEvent {}

class UpdateCategory extends CategoryEvent {}

class AddCategory extends CategoryEvent {}

class DeleteCategory extends CategoryEvent {
  final String categoryId;

  DeleteCategory({required this.categoryId});
}

class UpdateCurrentCategory extends CategoryEvent {
  final dynamic value;
  final CategoryFieldKeys fieldKeys;

  UpdateCurrentCategory({required this.value, required this.fieldKeys});
}
