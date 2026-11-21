import 'dart:convert';

class ShippingCostModel {
  final String? name;
  final String? code;
  final String? service;
  final String? description;
  final int? cost;
  final String? etd;

  ShippingCostModel({
    this.name,
    this.code,
    this.service,
    this.description,
    this.cost,
    this.etd,
  });

  factory ShippingCostModel.fromJson(String str) =>
      ShippingCostModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShippingCostModel.fromMap(Map<String, dynamic> json) =>
      ShippingCostModel(
        name: json["name"],
        code: json["code"],
        service: json["service"],
        description: json["description"],
        cost: json["cost"],
        etd: json["etd"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "code": code,
        "service": service,
        "description": description,
        "cost": cost,
        "etd": etd,
      };
}
