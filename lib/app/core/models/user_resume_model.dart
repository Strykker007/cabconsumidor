import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserResumeModel {
  int? userId;
  String? name;
  num? balance;
  num? blockedBalance;
  String? registerDate;
  String? updateDate;
  UserResumeModel({
    this.userId,
    this.name,
    this.balance,
    this.blockedBalance,
    this.registerDate,
    this.updateDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pk': userId,
      'dono_conta': name,
      'saldo_disponivel': balance,
      'saldo_bloqueado': blockedBalance,
      'data_cadastro': registerDate,
      'data_alteracao': updateDate,
    };
  }

  factory UserResumeModel.fromMap(Map<String, dynamic> map) {
    return UserResumeModel(
      userId: map['pk'] != null ? map['pk'] as int : null,
      name: map['dono_conta'] != null ? map['dono_conta'] as String : null,
      balance: map['saldo_disponivel'] != null
          ? map['saldo_disponivel'] as num
          : null,
      blockedBalance:
          map['saldo_bloqueado'] != null ? map['saldo_bloqueado'] as num : null,
      registerDate:
          map['data_cadastro'] != null ? map['data_cadastro'] as String : null,
      updateDate: map['data_alteracao'] != null
          ? map['data_alteracao'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResumeModel.fromJson(String source) =>
      UserResumeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
