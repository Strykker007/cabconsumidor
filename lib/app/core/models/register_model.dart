// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterModel {
  String? name;
  String? email;
  String? password;
  String? cpf;
  String? phone;
  String? birthDate;
  RegisterModel({
    this.name,
    this.email,
    this.password,
    this.cpf,
    this.phone,
    this.birthDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': name,
      'email': email,
      'senha': password,
      'cpf_cnpj': cpf,
      'celular': phone,
      'data_nascimento': birthDate,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      name: map['nome'] != null ? map['nome'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['senha'] != null ? map['senha'] as String : null,
      cpf: map['cpf_cnpj'] != null ? map['cpf_cnpj'] as String : null,
      phone: map['celular'] != null ? map['celular'] as String : null,
      birthDate: map['data_nascimento'] != null
          ? map['data_nascimento'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
