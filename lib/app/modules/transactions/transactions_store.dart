import 'package:cabconsumidor/app/core/models/transaction_register_model.dart';
import 'package:cabconsumidor/app/modules/transactions/transactions_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class TransactionsStore extends Store<List<TransactionRegisterModel>> {
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
