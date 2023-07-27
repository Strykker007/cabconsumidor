import 'dart:convert';

import 'package:cabproject/app/core/models/jwtmodel.dart';
import 'package:cabproject/app/core/models/user_model.dart';

class UserPreferencesModel {
  UserModel? user;
  JwtModel? jwt;
  UserPreferencesModel({
    this.user,
    this.jwt,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user?.toMap(),
      'jwt': jwt?.toMap(),
    };
  }

  factory UserPreferencesModel.fromMap(Map<String, dynamic> map) {
    return UserPreferencesModel(
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
      jwt: map['jwt'] != null ? JwtModel.fromMap(map['jwt']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPreferencesModel.fromJson(String source) =>
      UserPreferencesModel.fromMap(json.decode(source));
}
