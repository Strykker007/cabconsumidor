import 'dart:convert';

import 'package:cabproject/app/core/enums/transaction_type_enum.dart';

class TransactionModel {
  String? userId;
  num? amount;
  TransactionType? transactionType;
  DateTime? date;
  String? stablishmentName;
  String? stablishmentCode;
  TransactionModel({
    this.userId,
    this.amount,
    this.transactionType,
    this.date,
    this.stablishmentName,
    this.stablishmentCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'amount': amount,
      'transactionType': transactionType?.toJson,
      'date': date?.millisecondsSinceEpoch,
      'stablishmentName': stablishmentName,
      'stablishmentCode': stablishmentCode,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      userId: map['userId'],
      amount: map['amount'],
      transactionType: map['transactionType'] != null
          ? transactionTypeFromJson(map['transactionType'])
          : null,
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'])
          : null,
      stablishmentName: map['stablishmentName'],
      stablishmentCode: map['stablishmentCode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));
}
