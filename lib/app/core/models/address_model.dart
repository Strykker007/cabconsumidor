import 'dart:convert';

class AddressModel {
  String? id;
  int? city;
  String? district;
  int? state;
  String? zipCode;
  String? street;
  String? complement;
  AddressModel({
    this.id,
    this.city,
    this.district,
    this.state,
    this.zipCode,
    this.street,
    this.complement,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'city': city,
      'district': district,
      'state': state,
      'zipCode': zipCode,
      'street': street,
      'complement': complement,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'],
      city: map['city'],
      district: map['district'],
      state: map['state'],
      zipCode: map['zipCode'],
      street: map['street'],
      complement: map['complement'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));
}
