import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_foodstore/resource/model/cart_response_model.dart';

class CartRemoteResource {
  final Dio _dio;

  CartRemoteResource(this._dio);

  Future<Either<String, CartResponseModel>> fetchCart() async {
    try {
      final response = await _dio.get('public/carts');
      final result = CartResponseModel.fromMap(response.data['data']);
      return Right(result);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode?.toString() ?? '');
      } else {
        return Left(e.toString());
      }
    }
  }

  Future<Either<String, String>> cartStore(
    int productId,
    int qty,
  ) async {
    try {
      final response = await _dio.post(
        'public/carts',
        data: {
          'product_id': productId.toString(),
          'qty': qty.toString(),
        },
      );
      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode?.toString() ?? '');
      } else {
        return Left(e.toString());
      }
    }
  }

  Future<Either<String, String>> incrementCart(
    int productId,
    int cartId,
  ) async {
    try {
      final response = await _dio.post(
        'public/carts/increment',
        data: {
          'product_id': productId.toString(),
          'cart_id': cartId.toString(),
        },
      );
      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode?.toString() ?? '');
      } else {
        return Left(e.toString());
      }
    }
  }

  Future<Either<String, String>> decrementCart(
    int productId,
    int cartId,
  ) async {
    final response = await _dio.post(
      'public/carts/decrement',
      data: {
        'product_id': productId.toString(),
        'cart_id': cartId.toString(),
      },
    );
    try {
      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode?.toString() ?? '');
      } else {
        return Left(e.toString());
      }
    }
  }

  Future<Either<String, String>> removeCart(int cartId) async {
    final response = await _dio.delete(
      'public/carts/$cartId',
    );
    try {
      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.statusCode?.toString() ?? '');
      } else {
        return Left(e.toString());
      }
    }
  }
}
