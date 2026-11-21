import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/resource/model/checkout_model.dart';
import 'package:flutter_foodstore/resource/remote/checkout_remote_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_state.dart';
part 'checkout_cubit.freezed.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRemoteResource checkoutRemoteResource;
  CheckoutCubit(this.checkoutRemoteResource) : super(const CheckoutState.initial());

  void checkout(CheckoutModel checkout) async {
    final result = await checkoutRemoteResource.checkOut(checkout);
    result.fold(
      (error) => emit(CheckoutState.error(error)),
      (message) => emit(CheckoutState.success(message)),
    );
  }
}
