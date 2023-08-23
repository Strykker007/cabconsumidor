// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cabconsumidor/app/core/enums/banks_enum.dart';

class BankDataModel {
  int? pk;
  int? userId;
  BankEnum? bankName;
  String? agency;
  String? dvAgency;
  String? account;
  String? pix;
  String? registerDate;
  String? updateDate;
  BankDataModel({
    this.pk,
    this.userId,
    this.bankName,
    this.agency,
    this.dvAgency,
    this.account,
    this.pix,
    this.registerDate,
    this.updateDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pk': pk,
      'consumidor': userId,
      'banco': getCodeByEnum(bankName!),
      'agencia': agency,
      'dv_agencia': dvAgency,
      'conta': account,
      'pix': pix,
      'data_cadastro': registerDate,
      'data_alteracao': updateDate,
    };
  }

  factory BankDataModel.fromMap(Map<String, dynamic> map) {
    return BankDataModel(
      pk: map['pk'] != null ? map['pk'] as int : null,
      userId: map['consumidor'] != null ? map['consumidor'] as int : null,
      bankName: map['banco'] != null ? getBankByCode(map['banco']) : null,
      agency: map['agencia'] != null ? map['agencia'] as String : null,
      dvAgency: map['dv_agencia'] != null ? map['dv_agencia'] as String : null,
      account: map['conta'] != null ? map['conta'] as String : null,
      pix: map['pix'] != null ? map['pix'] as String : null,
      registerDate:
          map['data_cadastro'] != null ? map['data_cadastro'] as String : null,
      updateDate: map['data_alteracao'] != null
          ? map['data_alteracao'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BankDataModel.fromJson(String source) =>
      BankDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
