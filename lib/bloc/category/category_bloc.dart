import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:market/data/models/category/category_model.dart';
import 'package:market/data/models/category/category_model_fields.dart';
import 'package:market/data/models/status.dart';
import 'package:market/data/models/universal_data.dart';
import 'package:market/repositories/category_repository.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.categoryRepository})
      : super(
          CategoryState(
            categoryModel: CategoryModel(
              categoryId: '',
              categoryName: '',
              description: '',
              imageUrl: '',
              createdAt: '',
            ),
            categories: const [],
            status: FormStatus.pure,
            statusMessage: '',
          ),
        ) {
    on<CategoryEvent>((event, emit) {});
  }

  final CategoryRepository categoryRepository;

  getCategories(GetCategories event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data = await categoryRepository.getCategories();
    debugPrint('Category: ${data.data}');
    if (data.error.isEmpty) {
      emit(
        state.copyWith(
          statusMessage: 'Categories loaded successfully',
          status: FormStatus.success,
          categories: data.data,
        ),
      );
    } else {
      emit(
        state.copyWith(statusMessage: data.error, status: FormStatus.failure),
      );
    }
  }

  addCategory(AddCategory event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data =
        await categoryRepository.addCategory(state.categoryModel);
    debugPrint('Category: ${data.data}');
    if (data.error.isEmpty) {
      emit(
        state.copyWith(
          statusMessage: 'Category added successfully',
          status: FormStatus.success,
          categories: data.data,
        ),
      );
    } else {
      emit(
        state.copyWith(statusMessage: data.error, status: FormStatus.failure),
      );
    }
  }

  updateCategory(UpdateCategory event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data =
        await categoryRepository.updateCategory(state.categoryModel);
    debugPrint('Category: ${data.data}');
    if (data.error.isEmpty) {
      emit(
        state.copyWith(
          statusMessage: 'Category updated successfully',
          status: FormStatus.success,
          categories: data.data,
        ),
      );
    } else {
      emit(
        state.copyWith(statusMessage: data.error, status: FormStatus.failure),
      );
    }
  }

  deleteCategory(DeleteCategory event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data =
        await categoryRepository.deleteCategory(event.categoryId);
    debugPrint('Category: ${data.data}');
    if (data.error.isEmpty) {
      emit(
        state.copyWith(
          statusMessage: 'Category deleted successfully',
          status: FormStatus.success,
          categories: data.data,
        ),
      );
    } else {
      emit(
        state.copyWith(statusMessage: data.error, status: FormStatus.failure),
      );
    }
  }

  updateCurrentCategory(
      UpdateCurrentCategory event, Emitter<CategoryState> emit) async {
    CategoryModel category = state.categoryModel;

    switch (event.fieldKeys) {
      case CategoryFieldKeys.categoryName:
        category = category.copyWith(categoryName: event.value as String);
        break;

      case CategoryFieldKeys.categoryId:
        category = category.copyWith(categoryId: event.value as String);
        break;

      case CategoryFieldKeys.createdAt:
        category = category.copyWith(createdAt: event.value as String);
        break;

      case CategoryFieldKeys.imageUrl:
        category = category.copyWith(imageUrl: event.value as String);
        break;

      case CategoryFieldKeys.description:
        category = category.copyWith(description: event.value as String);
        break;
    }

    debugPrint("Category model: $category");
    emit(state.copyWith(categoryModel: category));
  }
}
