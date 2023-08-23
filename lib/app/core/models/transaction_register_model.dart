// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cabconsumidor/app/core/enums/transaction_type_enum.dart';

class TransactionRegisterModel {
  int? id;
  String? name;
  TransactionType? oparationType;
  String? amount;
  String? operationDescription;
  String? status;
  String? date;
  TransactionRegisterModel({
    this.id,
    this.name,
    this.oparationType,
    this.amount,
    this.operationDescription,
    this.status,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pk': id,
      'dono_conta': name,
      'tipo_operacao': oparationType,
      'valor': amount,
      'descricao_transacao': operationDescription,
      'status_operacao': status,
      'data_cadastro': date,
    };
  }

  factory TransactionRegisterModel.fromMap(Map<String, dynamic> map) {
    return TransactionRegisterModel(
      id: map['pk'] != null ? map['pk'] as int : null,
      name: map['dono_conta'] != null ? map['dono_conta'] as String : null,
      oparationType: map['tipo_operacao'] != null
          ? transactionTypeFromJson(map['tipo_operacao'])
          : null,
      amount: map['valor'] != null ? map['valor'] as String : null,
      operationDescription: map['descricao_transacao'] != null
          ? map['descricao_transacao'] as String
          : null,
      status: map['status_operacao'] != null
          ? map['status_operacao'] as String
          : null,
      date:
          map['data_cadastro'] != null ? map['data_cadastro'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionRegisterModel.fromJson(String source) =>
      TransactionRegisterModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
