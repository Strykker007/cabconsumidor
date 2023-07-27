import 'dart:convert';

class CredentialModel {
  String? username;
  String? password;
  CredentialModel({
    this.username,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory CredentialModel.fromMap(Map<String, dynamic> map) {
    return CredentialModel(
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CredentialModel.fromJson(String source) =>
      CredentialModel.fromMap(json.decode(source));
}
