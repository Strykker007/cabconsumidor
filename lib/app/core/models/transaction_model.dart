// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransactionModel {
  int? userId;
  int? sellerId;
  String? amount;
  TransactionModel({
    this.userId,
    this.sellerId,
    this.amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_consumidor': userId,
      'id_vendedor': sellerId,
      'valor': amount,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      userId: map['id_consumidor'] != null ? map['id_consumidor'] as int : null,
      sellerId: map['id_vendedor'] != null ? map['id_vendedor'] as int : null,
      amount: map['valor'] != null ? map['valor'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
