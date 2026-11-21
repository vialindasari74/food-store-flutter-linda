part of 'review_product_cubit.dart';

@freezed
class ReviewProductState with _$ReviewProductState {
  const factory ReviewProductState.initial() = _Initial;
  const factory ReviewProductState.successReviewProduct() =
      _SuccessReviewProduct;
  const factory ReviewProductState.errorReviewProduct(String message) =
      _ErrorReviewProduct;
}
