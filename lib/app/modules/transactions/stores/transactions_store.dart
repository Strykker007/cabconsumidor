import 'package:cabconsumidor/app/core/models/transaction_params_model.dart';
import 'package:cabconsumidor/app/core/models/transaction_register_model.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/transactions/transactions_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../core/utils/formaters.dart';

class TransactionsStore extends Store<List<TransactionRegisterModel>> {
  TransactionsStore() : super([]);

  @override
  void initStore() {
    params = TransactionParamsModel(
      userId: userStore.state.user!.userId!.toString(),
      finalDate: Formaters.dateToStringDateWithHifen(
        DateTime.now(),
      ),
      initialDate: Formaters.dateToStringDateWithHifen(
        DateTime.now().subtract(
          const Duration(
            days: 30,
          ),
        ),
      ),
    );
    super.initStore();
  }

  final TransactionsRepository _repository = Modular.get();
  final UserStore userStore = Modular.get();
  late TransactionParamsModel params;

  Future<void> getTransactionsList() async {
    setLoading(true);
    await _repository.getTransactionsList(params).then((transactions) {
      update(transactions);
      setLoading(false);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }
}
