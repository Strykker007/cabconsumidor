import 'dart:convert';

class SellerModel {
  String? photoUrl;
  String? code;
  String? name;
  String? distance;
  String? location;
  String? category;
  SellerModel({
    this.photoUrl,
    this.code,
    this.name,
    this.distance,
    this.location,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'photoUrl': photoUrl,
      'code': code,
      'name': name,
      'distance': distance,
      'location': location,
      'category': category,
    };
  }

  factory SellerModel.fromMap(Map<String, dynamic> map) {
    return SellerModel(
      photoUrl: map['photoUrl'],
      code: map['code'],
      name: map['name'],
      distance: map['distance'],
      location: map['location'],
      category: map['category'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SellerModel.fromJson(String source) =>
      SellerModel.fromMap(json.decode(source));
}
