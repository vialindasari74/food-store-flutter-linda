part of 'shipping_cost_cubit.dart';

@freezed
class ShippingCostState with _$ShippingCostState {
  const factory ShippingCostState.initial() = _Initial;
  const factory ShippingCostState.loading() = _Loading;
  const factory ShippingCostState.loaded(List<ShippingCostModel> shippingCost) =
      _Loaded;
  const factory ShippingCostState.error(dynamic message) = _Error;
}
