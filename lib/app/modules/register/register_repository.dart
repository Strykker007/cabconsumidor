// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:cabconsumidor/app/core/models/register_model.dart';

class RegisterRepository {
  final Dio client;
  RegisterRepository(
    this.client,
  );

  Future<void> register(RegisterModel model) async {
    try {
      await client.post(
        '/new-user/',
        data: model.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
