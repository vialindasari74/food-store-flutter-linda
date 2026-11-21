part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.fetchCart() = _FetchCart;
  const factory CartEvent.addCart({
    required int productId,
    required int qty,
  }) = _AddCart;
  const factory CartEvent.removeCart({required int cartId}) = _RemoveCart;
  const factory CartEvent.increment({
    required int productId,
    required int cartId,
  }) = _Increment;
  const factory CartEvent.decrement({
    required int productId,
    required int cartId,
  }) = _Decrement;
}
