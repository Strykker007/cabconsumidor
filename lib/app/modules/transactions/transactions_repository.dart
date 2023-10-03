import 'package:cabconsumidor/app/core/models/transaction_params_model.dart';
import 'package:cabconsumidor/app/core/models/transaction_register_model.dart';
import 'package:dio/dio.dart';

class TransactionsRepository {
  final Dio client;
  TransactionsRepository(
    this.client,
  );

  Future<List<TransactionRegisterModel>> getTransactionsList(
      TransactionParamsModel params) async {
    try {
      final response = await client.get(
        '/transacoes/',
        queryParameters: params.toMap(),
      );
      List<TransactionRegisterModel> transactions = List.empty(growable: true);

      response.data.forEach((transaction) {
        transactions.add(TransactionRegisterModel.fromMap(transaction));
      });

      return transactions.reversed.toList();
    } catch (e) {
      rethrow;
    }
  }
}
