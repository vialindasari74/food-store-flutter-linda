import 'dart:convert';
import 'package:flutter_foodstore/resource/model/product_model.dart';

class CategoryModel {
  int? id;
  String? image;
  String? name;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ProductModel>? products;

  CategoryModel({
    this.id,
    this.image,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.products,
  });

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        slug: json["slug"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        products: json["products"] == null
            ? []
            : List<ProductModel>.from(
                json["products"]!.map((x) => ProductModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "name": name,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toMap())),
      };
}
