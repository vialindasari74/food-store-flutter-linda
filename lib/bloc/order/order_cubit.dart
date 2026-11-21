import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/resource/model/order_model.dart';
import 'package:flutter_foodstore/resource/remote/order_remote_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_state.dart';
part 'order_cubit.freezed.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRemoteResource orderRemoteResource;

  OrderCubit(this.orderRemoteResource) : super(const OrderState.initial());

  int _currentPage = 1;
  bool _hasMore = true;
  final List<OrderModel> _orders = [];

  Future<void> fetchOrders(
      {bool isRefresh = false, bool isFetching = false}) async {
    if (isRefresh) {
      _currentPage = 1;
      _hasMore = true;
      _orders.clear();
      emit(const OrderState.loading());
    }

    final result = await orderRemoteResource.fetchOrders(page: _currentPage);
    result.fold(
      (error) {
        emit(OrderState.error(error));
      },
      (paging) {
        if (_hasMore) {
          _orders.addAll(paging.data as List<OrderModel>);
          _currentPage++;
          _hasMore = paging.nextPageUrl != null;
        }
        emit(OrderState.loadedOrder(List.from(_orders), hasMore: _hasMore));
      },
    );
  }

  void detailOrder(String snapToken) async {
    emit(const OrderState.loading());
    final result = await orderRemoteResource.detailOrder(snapToken);
    result.fold(
      (error) => emit(OrderState.error(error)),
      (order) => emit(OrderState.detail(order)),
    );
  }
}
