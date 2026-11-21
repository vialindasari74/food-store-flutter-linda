import 'dart:convert';

class CustomerModel {
  int? id;
  String? image;
  String? name;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;

  CustomerModel({
    this.id,
    this.image,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory CustomerModel.fromJson(String str) =>
      CustomerModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromMap(Map<String, dynamic> json) => CustomerModel(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        email: json["email"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "name": name,
        "email": email,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
