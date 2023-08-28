// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cabconsumidor/app/core/models/bank_data_model.dart';
import 'package:dio/dio.dart';

class BankDataRepository {
  final Dio client;
  BankDataRepository(
    this.client,
  );

  Future<void> updateBankData(BankDataModel bankData, int userId) async {
    try {
      bankData.userId = userId;
      await client.put(
        '/dados-bancario/',
        data: bankData.toJson(),
        queryParameters: {
          'id_consumidor': userId,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<BankDataModel> getBankData(String userId) async {
    try {
      final response =
          await client.get('/dados-bancario/', data: {'id_consumidor': userId});
      return BankDataModel.fromMap(response.data.first);
    } catch (e) {
      rethrow;
    }
  }
}
