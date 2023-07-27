import 'dart:convert';

class RegisterModel {
  String? name;
  String? email;
  String? password;
  String? cpf;
  String? phone;
  RegisterModel({
    this.name,
    this.email,
    this.password,
    this.cpf,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'cpf': cpf,
      'phone': phone,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      cpf: map['cpf'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source));
}
