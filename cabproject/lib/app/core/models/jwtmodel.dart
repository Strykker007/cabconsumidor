import 'dart:convert';

class JwtModel {
  int? id;
  String? name;
  String? email;
  String? token;
  String? refreshToken;
  JwtModel({
    this.id,
    this.name,
    this.email,
    this.token,
    this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'pk': id,
      'nome': name,
      'email': email,
      'token': token,
      'refresh': refreshToken,
    };
  }

  factory JwtModel.fromMap(Map<String, dynamic> map) {
    return JwtModel(
      id: map['pk'],
      name: map['nome'],
      email: map['email'],
      token: map['token'],
      refreshToken: map['refresh'],
    );
  }

  String toJson() => json.encode(toMap());

  factory JwtModel.fromJson(String source) =>
      JwtModel.fromMap(json.decode(source));
}
