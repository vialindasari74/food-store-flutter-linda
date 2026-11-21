import 'dart:convert';

class SliderModel {
  int? id;
  String? image;
  String? link;
  DateTime? createdAt;
  DateTime? updatedAt;

  SliderModel({
    this.id,
    this.image,
    this.link,
    this.createdAt,
    this.updatedAt,
  });

  factory SliderModel.fromJson(String str) =>
      SliderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SliderModel.fromMap(Map<String, dynamic> json) => SliderModel(
        id: json["id"],
        image: json["image"],
        link: json["link"],
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
        "link": link,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
