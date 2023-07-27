import 'package:dio/dio.dart';

import 'package:cabproject/app/core/models/transaction_model.dart';

class TransactionsRepository {
  final Dio client;
  TransactionsRepository(
    this.client,
  );

  Future<List<TransactionModel>> getTransactionsList(String userId) async {
    try {
      final response = await client.get('/transacoes/');
      List<TransactionModel> transactions = List.empty(growable: true);

      response.data.forEach((transaction) {
        transactions.add(TransactionModel.fromJson(transaction));
      });
      return transactions;
    } catch (e) {
      rethrow;
    }
  }
}
