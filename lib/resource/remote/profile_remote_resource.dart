import 'dart:io';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_foodstore/resource/model/customer_model.dart';

class ProfileRemoteResource {
  final Dio _dio;

  ProfileRemoteResource(this._dio);

  Future<Either<String, CustomerModel>> fetchProfile() async {
    try {
      final response = await _dio.get('customer/profile');
      if (response.statusCode == 200) {
        return Right(CustomerModel.fromMap(response.data['customer']));
      }
      return Left('Failed to fetch profile');
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<dynamic, String>> updateProfile({
    required String name,
    required String email,
    File? image,
    String? password,
    String? passwordConfirmation,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'name': name,
        'email': email,
        'image':
            image != null ? await MultipartFile.fromFile(image.path) : null,
        'password': password,
        'password_confirmation': passwordConfirmation
      });

      final response = await _dio.post(
        'customer/profile',
        data: formData,
        options: Options(
          headers: {
            "content-type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        return Left(e.response?.data);
      }
      return Left(e.toString());
    }
  }
}
