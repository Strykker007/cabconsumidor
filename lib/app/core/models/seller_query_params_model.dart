import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SellerQueryParamsModel {
  String? name;
  String? phantasyName;
  double? latitude;
  double? longitude;
  int? city;
  int? country;
  SellerQueryParamsModel({
    this.name,
    this.phantasyName,
    this.latitude,
    this.longitude,
    this.city,
    this.country,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': name,
      'nome_fantasia': phantasyName,
      'latitude': latitude,
      'longitude': longitude,
      'cidade': city,
      'estado': country,
    };
  }

  factory SellerQueryParamsModel.fromMap(Map<String, dynamic> map) {
    return SellerQueryParamsModel(
      name: map['nome'] != null ? map['nome'] as String : null,
      phantasyName:
          map['nome_fantasia'] != null ? map['nome_fantasia'] as String : null,
      latitude: map['latitude'] != null ? map['latitude'] as double : null,
      longitude: map['longitude'] != null ? map['longitude'] as double : null,
      city: map['cidade'] != null ? map['cidade'] as int : null,
      country: map['estado'] != null ? map['estado'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SellerQueryParamsModel.fromJson(String source) =>
      SellerQueryParamsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
