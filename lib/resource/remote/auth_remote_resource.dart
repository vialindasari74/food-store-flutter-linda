import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_foodstore/resource/local/auth_local_resource.dart';
import 'package:flutter_foodstore/resource/model/auth_response_model.dart';

class AuthRemoteResource {
  final Dio _dio;

  AuthRemoteResource(this._dio);

  Future<Either<String, AuthResponseModel>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        "customer/login",
        data: {
          'email': email,
          'password': password,
        },
      );

      String token = response.data['token'];
      await AuthLocalResource.saveToken(token);
      return Right(AuthResponseModel.fromMap(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(e.response?.data['message']);
      }
      return Left(e.toString());
    }
  }

  Future<Either<dynamic, String>> register(String name, String email,
      String password, String passwordConfirmation) async {
    try {
      final response = await _dio.post(
        'customer/register',
        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation
        },
      );
      return Right(response.data['message']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        return Left(e.response?.data);
      }
      return Left(e.toString());
    }
  }

  Future<String> logout() async {
    try {
      final token = await AuthLocalResource.getToken();
      final response = await _dio.post(
        'customer/logout',
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        await AuthLocalResource.deleteToken();
        return response.data['message'];
      } else {
        return "Failed to logout";
      }
    } on DioException catch (e) {
      return e.toString();
    }
  }
}
