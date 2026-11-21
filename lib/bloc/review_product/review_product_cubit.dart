import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/resource/remote/order_remote_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_product_state.dart';
part 'review_product_cubit.freezed.dart';

class ReviewProductCubit extends Cubit<ReviewProductState> {
  final OrderRemoteResource orderRemoteResource;

  ReviewProductCubit(this.orderRemoteResource)
      : super(const ReviewProductState.initial());

  Future<void> reviewProduct(
    int transactionDetailId,
    int productId,
    int rating,
    String review,
  ) async {
    try {
      emit(const ReviewProductState.initial());
      final response = await orderRemoteResource.reviewProduct(
        transactionDetailId,
        productId,
        rating,
        review,
      );
      response.fold((error) {
        emit(ReviewProductState.errorReviewProduct(error));
      }, (message) {
        emit(const ReviewProductState.successReviewProduct());
      });
    } catch (e) {
      emit(ReviewProductState.errorReviewProduct(e.toString()));
    }
  }
}
