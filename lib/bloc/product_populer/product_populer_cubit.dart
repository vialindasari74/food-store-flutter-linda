import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/resource/model/product_model.dart';
import 'package:flutter_foodstore/resource/remote/home_remote_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_populer_state.dart';
part 'product_populer_cubit.freezed.dart';

class ProductPopulerCubit extends Cubit<ProductPopulerState> {
  final HomeRemoteResource homeRemoteResource;
  ProductPopulerCubit(this.homeRemoteResource)
      : super(ProductPopulerState.initial());

  fetchProductPopuler() async {
    emit(ProductPopulerState.loading());
    final result = await homeRemoteResource.fetchProductsPopuler();
    result.fold(
      (error) => emit(ProductPopulerState.error(error)),
      (products) => emit(ProductPopulerState.loadedProductPopuler(products)),
    );
  }
}
