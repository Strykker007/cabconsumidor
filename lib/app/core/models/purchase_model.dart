// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PurchaseModel {
  int? id;
  String? name;
  String? sellerName;
  String? amount;
  String? date;
  PurchaseModel({
    this.id,
    this.name,
    this.sellerName,
    this.amount,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome_consumidor': name,
      'nome_vendedor': sellerName,
      'valor': amount,
      'data_cadastro': date,
    };
  }

  factory PurchaseModel.fromMap(Map<String, dynamic> map) {
    return PurchaseModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['nome_consumidor'] != null
          ? map['nome_consumidor'] as String
          : null,
      sellerName:
          map['nome_vendedor'] != null ? map['nome_vendedor'] as String : null,
      amount: map['valor'] != null ? map['valor'] as String : null,
      date:
          map['data_cadastro'] != null ? map['data_cadastro'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseModel.fromJson(String source) =>
      PurchaseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
