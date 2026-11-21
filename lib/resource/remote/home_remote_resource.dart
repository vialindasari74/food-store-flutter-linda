import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_foodstore/resource/model/api_response.dart';
import 'package:flutter_foodstore/resource/model/category_model.dart';
import 'package:flutter_foodstore/resource/model/paging_model.dart';
import 'package:flutter_foodstore/resource/model/product_model.dart';
import 'package:flutter_foodstore/resource/model/slider_model.dart';

class HomeRemoteResource {
  final Dio dio;
  HomeRemoteResource(this.dio);

  Future<Either<String, List<SliderModel>>> fetchSliders() async {
    try {
      final response = await dio.get('public/sliders');
      if (response.statusCode == 200) {
        final apiResponse =
            ApiResponse.fromJson(response.data, SliderModel.fromMap);
        return Right(apiResponse.data);
      }
      return Left('Failed to fetch slider');
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<CategoryModel>>> fetchCategories() async {
    try {
      final response = await dio.get('public/categories');
      if (response.statusCode == 200) {
        final apiResponse =
            ApiResponse.fromJson(response.data, CategoryModel.fromMap);
        return Right(apiResponse.data);
      }
      return Left('Failed to fetch Category');
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CategoryModel>> fetchCategoryBySlug(String slug) async {
    try {
      final response = await dio.get('public/categories/$slug');
      final apiResponse = ApiResponse.fromJson(
        response.data,
        CategoryModel.fromMap,
      );
      if (response.statusCode == 200) {
        return Right(apiResponse.data);
      }
      return Left('Failed to fetch Product');
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, PagingModel<ProductModel>>> fetchProducts({
    int page = 0,
    String query = '',
  }) async {
    try {
      final response =
          await dio.get('public/products?page=$page&search=$query');
      final result =
          PagingModel.fromMap(response.data['data'], ProductModel.fromMap);
      return Right(result);
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> fetchProductsPopuler() async {
    try {
      final response = await dio.get('public/products-popular');
      final apiResponse =
          ApiResponse.fromJson(response.data, ProductModel.fromMap);
      return Right(apiResponse.data);
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, ProductModel>> detailProduct(String slug) async {
    try {
      final response = await dio.get('public/products/$slug');
      final apiResponse =
          ApiResponse.fromJson(response.data, ProductModel.fromMap);
      return Right(apiResponse.data);
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }
}
