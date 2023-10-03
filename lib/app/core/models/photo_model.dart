import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PhotoModel {
  int? userId;
  String? photo;
  PhotoModel({
    this.userId,
    this.photo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_consumidor': userId,
      'imagem': photo,
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
      userId: map['id_consumidor'] != null ? map['id_consumidor'] as int : null,
      photo: map['imagem'] != null ? map['imagem'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotoModel.fromJson(String source) =>
      PhotoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
