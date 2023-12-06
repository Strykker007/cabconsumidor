import 'dart:convert';

class CountryModel {
  int? id;
  String? name;
  String? uf;
  String? uheueh;

  CountryModel({
    this.id,
    this.name,
    this.uf,
    this.uheueh,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': name,
      'sigla': uf,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['nome'] != null ? map['nome'] as String : null,
      uf: map['sigla'] != null ? map['sigla'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
