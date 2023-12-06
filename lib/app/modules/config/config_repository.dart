import 'package:dio/dio.dart';

class ConfigRepository {
  final Dio _client;

  ConfigRepository(this._client);

  Future<void> deleteUser(String userId) async {
    try {
      await _client.post(
        '/excluir-conta/',
        data: {
          'id_consumidor': userId,
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
