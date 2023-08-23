// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SellerModel {
  int? pk;
  String? name;
  String? fantasyName;
  String? email;
  String? cpfCnpj;
  String? cep;
  int? country;
  int? city;
  String? neighborhood;
  String? address;
  String? number;
  String? complement;
  String? phone;
  String? whatsapp;
  String? website;
  String? transfer;
  String? logo;
  double? distance;

  SellerModel({
    this.pk,
    this.name,
    this.fantasyName,
    this.email,
    this.cpfCnpj,
    this.cep,
    this.country,
    this.city,
    this.neighborhood,
    this.address,
    this.number,
    this.complement,
    this.phone,
    this.whatsapp,
    this.website,
    this.transfer,
    this.logo,
    this.distance,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pk': pk,
      'nome': name,
      'nomeFantasia': fantasyName,
      'email': email,
      'cpfCnpj': cpfCnpj,
      'cep': cep,
      'estado': country,
      'cidade': city,
      'bairro': neighborhood,
      'endereco': address,
      'numero': number,
      'complemento': complement,
      'telefone': phone,
      'whatsapp': whatsapp,
      'website': website,
      'repasse': transfer,
      'logomarca': logo,
      'distancia': distance,
    };
  }

  factory SellerModel.fromMap(Map<String, dynamic> map) {
    return SellerModel(
      pk: map['pk'] != null ? map['pk'] as int : 0,
      name: map['nome'] != null ? map['nome'] as String : '',
      fantasyName:
          map['nomeFantasia'] != null ? map['nomeFantasia'] as String : '',
      email: map['email'] != null ? map['email'] as String : '',
      cpfCnpj: map['cpfCnpj'] != null ? map['cpfCnpj'] as String : '',
      cep: map['cep'] != null ? map['cep'] as String : '',
      country: map['estado'] != null ? map['estado'] as int : 0,
      city: map['cidade'] != null ? map['cidade'] as int : 0,
      neighborhood: map['bairro'] != null ? map['bairro'] as String : '',
      address: map['endereco'] != null ? map['endereco'] as String : '',
      number: map['numero'] != null ? map['numero'] as String : '',
      complement:
          map['complemento'] != null ? map['complemento'] as String : '',
      phone: map['telefone'] != null ? map['telefone'] as String : '',
      whatsapp: map['whatsapp'] != null ? map['whatsapp'] as String : '',
      website: map['website'] != null ? map['website'] as String : '',
      transfer: map['repasse'] != null ? map['repasse'] as String : '',
      logo: map['logomarca'] != null ? map['logomarca'] as String : '',
      distance: map['distancia'] != null ? map['distancia'] as double : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SellerModel.fromJson(String source) =>
      SellerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
