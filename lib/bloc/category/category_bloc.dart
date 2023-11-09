import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:market/data/models/category/category_model.dart';
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
    if (data.error.isEmpty) {
      emit(
        state.copyWith(
          statusMessage: 'Categories loaded successfully',
          status: FormStatus.success,
          // categories: data.data,
        ),
      );
    }
  }
}
