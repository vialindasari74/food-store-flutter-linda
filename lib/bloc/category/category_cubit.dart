import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/resource/model/category_model.dart';
import 'package:flutter_foodstore/resource/remote/home_remote_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final HomeRemoteResource homeRemoteResource;
  CategoryCubit(this.homeRemoteResource) : super(CategoryState.initial());

  fetchCategory() async {
    emit(CategoryState.loading());
    final result = await homeRemoteResource.fetchCategories();
    result.fold(
      (error) => emit(
        CategoryState.error(error.toString()),
      ),
      (categories) => emit(
        CategoryState.loaded(categories),
      ),
    );
  }

  fetchCategoryBySlug(String slug) async {
    emit(CategoryState.loading());
    final result = await homeRemoteResource.fetchCategoryBySlug(slug);
    result.fold(
      (error) => emit(
        CategoryState.error(error.toString()),
      ),
      (product) => emit(
        CategoryState.loadedCategoryBySlug(product),
      ),
    );
  }
}
