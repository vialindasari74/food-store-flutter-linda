import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_foodstore/resource/model/order_model.dart';
import 'package:flutter_foodstore/resource/model/paging_model.dart';

class OrderRemoteResource {
  final Dio _dio;

  OrderRemoteResource(this._dio);

  Future<Either<String, PagingModel>> fetchOrders({int page = 0}) async {
    try {
      final response = await _dio.get('customer/my-orders?page=$page');
      final result =
          PagingModel.fromMap(response.data['data'], OrderModel.fromMap);
      return Right(result);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode?.toString() ?? '');
      } else {
        return Left(e.toString());
      }
    }
  }

  Future<Either<String, dynamic>> detailOrder(String snapToken) async {
    try {
      final response = await _dio.get('customer/my-orders/$snapToken');
      return Right(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode?.toString() ?? '');
      } else {
        return Left(e.toString());
      }
    }
  }

  Future<Either<String, String>> reviewProduct(
    int transactionDetailId,
    int productId,
    int rating,
    String review,
  ) async {
    try {
      final response = await _dio.post(
        'customer/ratings',
        data: {
          'transaction_detail_id': transactionDetailId,
          'product_id': productId,
          'rating': rating,
          'review': review
        },
      );
      return Right(response.data['message']);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }
}
