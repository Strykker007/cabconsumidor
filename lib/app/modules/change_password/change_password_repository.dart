import 'package:cabconsumidor/app/core/models/change_password_model.dart';
import 'package:dio/dio.dart';

class ChangePasswordRepository {
  final Dio _client;

  ChangePasswordRepository(this._client);

  Future<void> changePassword(ChangePasswordModel model) async {
    try {
      await _client.post('/trocar-senha/', data: model.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
