import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/resource/model/product_model.dart';
import 'package:flutter_foodstore/resource/remote/home_remote_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  final HomeRemoteResource homeRemoteResource;
  ProductCubit(this.homeRemoteResource) : super(ProductState.initial());

  int _currentPage = 1;
  bool _hasMore = true;
  final List<ProductModel> _products = [];

  Future<void> fetchProduct({bool isRefresh = false, String query = ''}) async {
    if (isRefresh) {
      _currentPage = 1;
      _hasMore = true;
      _products.clear();
      emit(ProductState.loading());
    }

    final result = await homeRemoteResource.fetchProducts(
      page: _currentPage,
      query: query,
    );
    result.fold(
      (error) => emit(ProductState.error(error)),
      (paging) {
        if (_hasMore) {
          _hasMore = paging.nextPageUrl != null;
          _products.addAll(paging.data as List<ProductModel>);
          _currentPage++;
        }
        emit(ProductState.loadedProduct(
          List.from(_products),
          hasMore: _hasMore,
        ));
      },
    );
  }

  Future<void> detailProduct(String slug) async {
    emit(ProductState.loading());
    final result = await homeRemoteResource.detailProduct(slug);
    result.fold(
      (error) => emit(ProductState.error(error)),
      (product) => emit(ProductState.loadedDetailProduct(product)),
    );
  }
}
