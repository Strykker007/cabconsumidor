// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cabconsumidor/app/core/models/deposit_model.dart';
import 'package:dio/dio.dart';

class DepositRepository {
  final Dio client;
  DepositRepository(
    this.client,
  );
  Future<void> depositAmount(
    DepositModel data,
  ) async {
    try {
      await client.post('/deposito/', data: data.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
