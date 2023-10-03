import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionParamsModel {
  String? userId;
  String? initialDate;
  String? finalDate;
  TransactionParamsModel({
    this.userId,
    this.initialDate,
    this.finalDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_consumidor': userId,
      'data_inicial': initialDate,
      'data_fim': finalDate,
    };
  }

  factory TransactionParamsModel.fromMap(Map<String, dynamic> map) {
    return TransactionParamsModel(
      userId:
          map['id_consumidor'] != null ? map['id_consumidor'] as String : null,
      initialDate:
          map['data_inicial'] != null ? map['data_inicial'] as String : null,
      finalDate: map['data_fim'] != null ? map['data_fim'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionParamsModel.fromJson(String source) =>
      TransactionParamsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
