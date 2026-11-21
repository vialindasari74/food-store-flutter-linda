part of 'product_populer_cubit.dart';

@freezed
class ProductPopulerState with _$ProductPopulerState {
  const factory ProductPopulerState.initial() = _Initial;
  const factory ProductPopulerState.loading() = _Loading;
  const factory ProductPopulerState.loadedProductPopuler(
      List<ProductModel> products) = _LoadedProductPopuler;
  const factory ProductPopulerState.error(String message) = _Error;
}
