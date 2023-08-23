import 'dart:convert';

class CityModel {
  int? id;
  String? name;
  String? uf;

  CityModel({
    this.id,
    this.name,
    this.uf,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': name,
      'sigla': uf,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['nome'] != null ? map['nome'] as String : null,
      uf: map['sigla'] != null ? map['sigla'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
