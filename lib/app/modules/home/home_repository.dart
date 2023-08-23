import 'package:cabconsumidor/app/core/models/user_resume_model.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final Dio client;

  HomeRepository(this.client);

  Future<UserResumeModel> getBalanceValue(String userId) async {
    try {
      final response = await client.get(
        '/resumo/',
        queryParameters: {'id_consumidor': userId},
      );
      return UserResumeModel.fromMap(response.data.first);
    } catch (e) {
      rethrow;
    }
  }
}
