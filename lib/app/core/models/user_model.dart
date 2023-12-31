import 'dart:convert';

import 'package:cabconsumidor/app/core/models/bank_data_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserModel {
  int? userId;
  String? profilePhoto;
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? birthDate;
  String? postalCode;
  int? country;
  int? city;
  String? neightbor;
  String? street;
  String? streetNumber;
  String? complement;
  BankDataModel? bankData;
  UserModel({
    this.userId,
    this.profilePhoto,
    this.name,
    this.email,
    this.phone,
    this.cpf,
    this.birthDate,
    this.postalCode,
    this.country,
    this.city,
    this.neightbor,
    this.street,
    this.streetNumber,
    this.complement,
    this.bankData,
  });

  Map<String, dynamic> toMap() {
    return {
      'pk': userId,
      'imagem_url': profilePhoto,
      'nome': name,
      'email': email,
      'celular': phone,
      'cpf_cnpj': cpf,
      'data_nascimento': birthDate,
      'cep': postalCode,
      'estado': country,
      'cidade': city,
      'bairro': neightbor,
      'endereco': street,
      'numero': streetNumber,
      'complemento': complement,
      'bankData': bankData?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['pk'],
      profilePhoto: map['imagem_url'],
      name: map['nome'],
      email: map['email'],
      phone: map['celular'],
      cpf: map['cpf_cnpj'],
      birthDate: map['data_nascimento'],
      postalCode: map['cep'],
      country: map['estado'],
      city: map['cidade'],
      neightbor: map['bairro'],
      street: map['endereco'],
      streetNumber: map['numero'],
      complement: map['complemento'],
      // address: map['address'] != null
      //     ? AddressModel.fromMap(map['address'])
      //     : AddressModel(),
      // bankData: map['bankData'] != null
      //     ? BankDataModel.fromMap(map['bankData'])
      //     : BankDataModel(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
