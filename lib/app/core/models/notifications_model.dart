// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotificationsModel {
  int? id;
  int? userId;
  String? title;
  String? message;
  String? registerDate;
  String? updateDate;
  bool? isActive;
  NotificationsModel({
    this.id,
    this.userId,
    this.title,
    this.message,
    this.registerDate,
    this.updateDate,
    this.isActive,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pk': id,
      'consumidor': userId,
      'title': title,
      'message': message,
      'registerDate': registerDate,
      'updateDate': updateDate,
      'isActive': isActive,
    };
  }

  factory NotificationsModel.fromMap(Map<String, dynamic> map) {
    return NotificationsModel(
      id: map['pk'] != null ? map['pk'] as int : null,
      userId: map['consumidor'] != null ? map['consumidor'] as int : null,
      title: map['titulo'] != null ? map['titulo'] as String : null,
      message: map['msg'] != null ? map['msg'] as String : null,
      registerDate: map['data_cadastro'],
      updateDate: map['data_alteracao'],
      isActive: map['ativo'] != null ? map['ativo'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationsModel.fromJson(String source) =>
      NotificationsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
