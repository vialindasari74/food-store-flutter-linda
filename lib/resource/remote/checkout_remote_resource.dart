import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_foodstore/resource/model/checkout_model.dart';
import 'package:flutter_foodstore/resource/model/location_model.dart';
import 'package:flutter_foodstore/resource/model/shipping_cost_model.dart';

class CheckoutRemoteResource {
  final Dio _dio;
  CheckoutRemoteResource(this._dio);

  Future<Either<String, List<LocationModel>>> getLocation(String search) async {
    try {
      final response = await _dio.get(
        'public/search-destination',
        queryParameters: {'search': search},
      );
      final data = response.data;
      if (data is! List) {
        return Left(
          'Format respons pencarian lokasi tidak valid: ${data.runtimeType}',
        );
      }
      final result = data
          .map((item) => LocationModel.fromMap(
                Map<String, dynamic>.from(item as Map),
              ))
          .toList();
      return Right(result);
    } on DioException catch (e) {
      return Left(e.toString());
    } catch (e) {
      return Left('Gagal membaca respons pencarian lokasi: $e');
    }
  }

  Future<Either<String, List<ShippingCostModel>>> getShippingCost(
    int cityId,
    int weight,
    String courierName,
  ) async {
    try {
      final response = await _dio.post(
        'public/check-ongkir',
        data: {
          'destination': cityId,
          'weight': weight,
          'courier': courierName,
        },
      );
      List<dynamic> data = response.data;
      final result = data.map((e) => ShippingCostModel.fromMap(e)).toList();
      return Right(result);
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> checkOut(CheckoutModel checkout) async {
    try {
      final response = await _dio.post('public/checkout', data: {
        'province_name': checkout.provinceName,
        'city_name': checkout.cityName,
        'district_name': checkout.districtName,
        'subdistrict_name': checkout.subdistrictName,
        'zip_code': checkout.zipCode,
        'full_address': checkout.fullAddress,
        'weight': checkout.weight,
        'shipping_courier': checkout.shippingCourier,
        'shipping_service': checkout.shippingService,
        'shipping_cost': checkout.shippingCost,
        'total': checkout.total,
      });
      return Right(response.data['data']['snap_token']);
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }
}
