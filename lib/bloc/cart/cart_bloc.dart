import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/resource/model/cart_response_model.dart';
import 'package:flutter_foodstore/resource/remote/cart_remote_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRemoteResource cartRemoteResource;

  CartBloc(this.cartRemoteResource) : super(const _Initial()) {
    on<CartEvent>((event, emit) async {
      await event.when(
        fetchCart: () async {
          emit(const CartState.loading());
          final result = await cartRemoteResource.fetchCart();
          result.fold(
            (error) => emit(CartState.error(error)),
            (cartResponse) => emit(CartState.loaded(cartResponse)),
          );
        },
        addCart: (productId, qty) async {
          emit(const CartState.loading());
          final result = await cartRemoteResource.cartStore(productId, qty);
          result.fold(
            (error) => emit(CartState.error(error)),
            (message) => emit(CartState.cartStored(message)),
          );
        },
        removeCart: (cartId) async {
          await cartRemoteResource.removeCart(cartId);
          final result = await cartRemoteResource.fetchCart();
          result.fold(
            (error) => emit(CartState.error(error)),
            (cartResponse) => emit(CartState.loaded(cartResponse)),
          );
        },
        increment: (productId, cartId) async {
          await cartRemoteResource.incrementCart(productId, cartId);
          final result = await cartRemoteResource.fetchCart();
          result.fold(
            (error) => emit(CartState.error(error)),
            (cartResponse) => emit(CartState.loaded(cartResponse)),
          );
        },
        decrement: (productId, cartId) async {
          await cartRemoteResource.decrementCart(productId, cartId);
          final result = await cartRemoteResource.fetchCart();
          result.fold(
            (error) => emit(CartState.error(error)),
            (cartResponse) => emit(CartState.loaded(cartResponse)),
          );
        },
      );
    });
  }
}
