import 'dart:convert';

class BankDataModel {
  String? bankName;
  String? account;
  String? accountDigit;
  String? agency;
  String? agencyDigit;
  String? titularName;
  BankDataModel({
    this.bankName,
    this.account,
    this.accountDigit,
    this.agency,
    this.agencyDigit,
  });

  Map<String, dynamic> toMap() {
    return {
      'bankName': bankName,
      'account': account,
      'accountDigit': accountDigit,
      'agency': agency,
      'agencyDigit': agencyDigit,
    };
  }

  factory BankDataModel.fromMap(Map<String, dynamic> map) {
    return BankDataModel(
      bankName: map['bankName'],
      account: map['account'],
      accountDigit: map['accountDigit'],
      agency: map['agency'],
      agencyDigit: map['agencyDigit'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BankDataModel.fromJson(String source) =>
      BankDataModel.fromMap(json.decode(source));
}
