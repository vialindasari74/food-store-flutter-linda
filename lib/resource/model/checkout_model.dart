import 'dart:convert';

class CheckoutModel {
  String provinceName;
  String cityName;
  String districtName;
  String subdistrictName;
  String zipCode;
  String fullAddress;
  int weight;
  String shippingCourier;
  String shippingService;
  int shippingCost;
  int total;

  CheckoutModel({
    required this.provinceName,
    required this.cityName,
    required this.districtName,
    required this.subdistrictName,
    required this.zipCode,
    required this.fullAddress,
    required this.weight,
    required this.shippingCourier,
    required this.shippingService,
    required this.shippingCost,
    required this.total,
  });

  @override
  String toString() {
    return 'CheckoutModel(provinceName: $provinceName, cityName: $cityName, districtName: $districtName, subdistrictName: $subdistrictName, zipCode: $zipCode, fullAddress: $fullAddress, weight: $weight, shippingCourier: $shippingCourier, shippingService: $shippingService, shippingCost: $shippingCost, total: $total)';
  }

  CheckoutModel copyWith({
    String? provinceName,
    String? cityName,
    String? districtName,
    String? subdistrictName,
    String? zipCode,
    String? fullAddress,
    int? weight,
    String? shippingCourier,
    String? shippingService,
    int? shippingCost,
    int? total,
  }) {
    return CheckoutModel(
      provinceName: provinceName ?? this.provinceName,
      cityName: cityName ?? this.cityName,
      districtName: districtName ?? this.districtName,
      subdistrictName: subdistrictName ?? this.subdistrictName,
      zipCode: zipCode ?? this.zipCode,
      fullAddress: fullAddress ?? this.fullAddress,
      weight: weight ?? this.weight,
      shippingCourier: shippingCourier ?? this.shippingCourier,
      shippingService: shippingService ?? this.shippingService,
      shippingCost: shippingCost ?? this.shippingCost,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'provinceName': provinceName,
      'cityName': cityName,
      'districtName': districtName,
      'subdistrictName': subdistrictName,
      'zipCode': zipCode,
      'fullAddress': fullAddress,
      'weight': weight,
      'shippingCourier': shippingCourier,
      'shippingService': shippingService,
      'shippingCost': shippingCost,
      'total': total,
    };
  }

  factory CheckoutModel.fromMap(Map<String, dynamic> map) {
    return CheckoutModel(
      provinceName: map['provinceName'] as String,
      cityName: map['cityName'] as String,
      districtName: map['districtName'] as String,
      subdistrictName: map['subdistrictName'] as String,
      zipCode: map['zipCode'] as String,
      fullAddress: map['fullAddress'] as String,
      weight: map['weight'] as int,
      shippingCourier: map['shippingCourier'] as String,
      shippingService: map['shippingService'] as String,
      shippingCost: map['shippingCost'] as int,
      total: map['total'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckoutModel.fromJson(String source) =>
      CheckoutModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant CheckoutModel other) {
    if (identical(this, other)) return true;

    return other.provinceName == provinceName &&
        other.cityName == cityName &&
        other.districtName == districtName &&
        other.subdistrictName == subdistrictName &&
        other.zipCode == zipCode &&
        other.fullAddress == fullAddress &&
        other.weight == weight &&
        other.shippingCourier == shippingCourier &&
        other.shippingService == shippingService &&
        other.shippingCost == shippingCost &&
        other.total == total;
  }

  @override
  int get hashCode {
    return provinceName.hashCode ^
        cityName.hashCode ^
        districtName.hashCode ^
        subdistrictName.hashCode ^
        zipCode.hashCode ^
        fullAddress.hashCode ^
        weight.hashCode ^
        shippingCourier.hashCode ^
        shippingService.hashCode ^
        shippingCost.hashCode ^
        total.hashCode;
  }
}
