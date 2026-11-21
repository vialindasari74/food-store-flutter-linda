import 'dart:convert';
import 'package:flutter_foodstore/resource/model/category_model.dart';
import 'package:flutter_foodstore/resource/model/rating_model.dart';

class ProductModel {
  int? id;
  int? categoryId;
  String? image;
  String? title;
  String? slug;
  String? description;
  int? price;
  int? weight;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? ratingsAvgRating;
  CategoryModel? category;
  List<RatingModel>? ratings;

  ProductModel({
    this.id,
    this.categoryId,
    this.image,
    this.title,
    this.slug,
    this.description,
    this.price,
    this.weight,
    this.createdAt,
    this.updatedAt,
    this.ratingsAvgRating,
    this.category,
    this.ratings,
  });

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        categoryId: json["category_id"],
        image: json["image"],
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        price: num.tryParse(json["price"]?.toString() ?? '')?.toInt(),
        weight: json["weight"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        ratingsAvgRating: json["ratings_avg_rating"],
        category: json["category"] == null
            ? null
            : CategoryModel.fromMap(json["category"]),
        ratings: json["ratings"] == null
            ? []
            : List<RatingModel>.from(
                json["ratings"]!.map((x) => RatingModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category_id": categoryId,
        "image": image,
        "title": title,
        "slug": slug,
        "description": description,
        "price": price,
        "weight": weight,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "ratings_avg_rating": ratingsAvgRating,
        "category": category?.toMap(),
        "ratings": ratings == null
            ? []
            : List<dynamic>.from(ratings!.map((x) => x.toMap())),
      };
}
