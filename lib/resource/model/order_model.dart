import 'dart:convert';
import 'package:flutter_foodstore/resource/model/customer_model.dart';

class OrderModel {
  final int? id;
  final int? customerId;
  final String? provinceName;
  final String? cityName;
  final String? districtName;
  final String? subdistrictName;
  final int? zipCode;
  final String? fullAddress;
  final String? invoice;
  final int? weight;
  final int? total;
  final String? status;
  final String? snapToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final CustomerModel? customer;

  OrderModel({
    this.id,
    this.customerId,
    this.provinceName,
    this.cityName,
    this.districtName,
    this.subdistrictName,
    this.zipCode,
    this.fullAddress,
    this.invoice,
    this.weight,
    this.total,
    this.status,
    this.snapToken,
    this.createdAt,
    this.updatedAt,
    this.customer,
  });

  factory OrderModel.fromJson(String str) =>
      OrderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        customerId: json["customer_id"],
        provinceName: json["province_name"],
        cityName: json["city_name"],
        districtName: json["district_name"],
        subdistrictName: json["subdistrict_name"],
        zipCode: json["zip_code"],
        fullAddress: json["full_address"],
        invoice: json["invoice"],
        weight: json["weight"],
        total: json["total"],
        status: json["status"],
        snapToken: json["snap_token"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        customer: json["customer"] == null
            ? null
            : CustomerModel.fromMap(json["customer"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "customer_id": customerId,
        "province_name": provinceName,
        "city_name": cityName,
        "district_name": districtName,
        "subdistrict_name": subdistrictName,
        "zip_code": zipCode,
        "full_address": fullAddress,
        "invoice": invoice,
        "weight": weight,
        "total": total,
        "status": status,
        "snap_token": snapToken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "customer": customer?.toMap(),
      };
}
