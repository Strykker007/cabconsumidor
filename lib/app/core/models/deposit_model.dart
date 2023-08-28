import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DepositModel {
  int? userId;
  String? amount;
  DepositModel({
    this.userId,
    this.amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_consumidor': userId,
      'valor': amount,
    };
  }

  factory DepositModel.fromMap(Map<String, dynamic> map) {
    return DepositModel(
      userId: map['id_consumidor'] != null ? map['id_consumidor'] as int : null,
      amount: map['valor'] != null ? map['valor'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DepositModel.fromJson(String source) =>
      DepositModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
