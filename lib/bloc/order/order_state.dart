part of 'order_cubit.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.loadedOrder(List<OrderModel> orders,
      {required bool hasMore}) = _Loaded;
  const factory OrderState.detail(dynamic detailOrder) = _DetailOrder;
  const factory OrderState.error(String message) = _Error;
}
