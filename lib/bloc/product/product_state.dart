part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.loadedProduct(List<ProductModel> products,
      {required bool hasMore}) = _LoadedProduct;
  const factory ProductState.loadedDetailProduct(ProductModel product) =
      _LoadedDetailProduct;
  const factory ProductState.error(String message) = _Error;
}
