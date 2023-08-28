import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DepositHistoryModel {
  int? id;
  String? userName;
  String? amount;
  bool? approved;
  String? creationDate;
  String? updatedDate;
  DepositHistoryModel({
    this.id,
    this.userName,
    this.amount,
    this.approved,
    this.creationDate,
    this.updatedDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pk': id,
      'dono_conta': userName,
      'valor': amount,
      'sucesso': approved,
      'data_cadastro': creationDate,
      'data_alteracao': updatedDate,
    };
  }

  factory DepositHistoryModel.fromMap(Map<String, dynamic> map) {
    return DepositHistoryModel(
      id: map['pk'] != null ? map['pk'] as int : null,
      userName: map['dono_conta'] != null ? map['dono_conta'] as String : null,
      amount: map['valor'] != null ? map['valor'] as String : null,
      approved: map['sucesso'] != null ? map['sucesso'] as bool : null,
      creationDate:
          map['data_cadastro'] != null ? map['data_cadastro'] as String : null,
      updatedDate: map['data_alteracao'] != null
          ? map['data_alteracao'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DepositHistoryModel.fromJson(String source) =>
      DepositHistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
