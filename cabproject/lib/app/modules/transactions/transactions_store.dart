import 'package:cabproject/app/core/models/transaction_model.dart';
import 'package:cabproject/app/modules/transactions/transactions_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class TransactionsStore extends Store<List<TransactionModel>> {
  TransactionsStore() : super([]);

  final TransactionsRepository _repository = Modular.get();

  Future<void> getTransactionsList(String userId) async {
    setLoading(true);
    await _repository.getTransactionsList(userId).then((transactions) {
      update(transactions);
      setLoading(false);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }
}
