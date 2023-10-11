import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChangePasswordModel {
  String? id;
  String? oldPassword;
  String? confirmPassword;
  String? newPassword;
  ChangePasswordModel({
    this.id,
    this.oldPassword,
    this.confirmPassword,
    this.newPassword,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_consumidor': id,
      'senha_atual': oldPassword,
      'confirmar_senha': oldPassword,
      'nova_senha': newPassword,
    };
  }

  factory ChangePasswordModel.fromMap(Map<String, dynamic> map) {
    return ChangePasswordModel(
      id: map['id_consumidor'] != null ? map['id_consumidor'] as String : null,
      oldPassword:
          map['senha_atual'] != null ? map['senha_atual'] as String : null,
      newPassword:
          map['nova_senha'] != null ? map['nova_senha'] as String : null,
      confirmPassword: map['confirmar_senha'] != null
          ? map['confirmar_senha'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangePasswordModel.fromJson(String source) =>
      ChangePasswordModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
