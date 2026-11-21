import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/resource/model/shipping_cost_model.dart';
import 'package:flutter_foodstore/resource/remote/checkout_remote_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_cost_state.dart';
part 'shipping_cost_cubit.freezed.dart';

class ShippingCostCubit extends Cubit<ShippingCostState> {
  final CheckoutRemoteResource checkoutRemoteResource;
  ShippingCostCubit(this.checkoutRemoteResource)
      : super(const ShippingCostState.initial());

  getShippingCost(int destination, int weight, String courier) async {
    emit(const ShippingCostState.loading());
    final result = await checkoutRemoteResource.getShippingCost(
      destination,
      weight,
      courier,
    );
    result.fold(
      (error) => emit(ShippingCostState.error(error)),
      (shippingCost) => emit(ShippingCostState.loaded(shippingCost)),
    );
  }

  resetShippingCost() {
    emit(const ShippingCostState.initial());
  }
}
