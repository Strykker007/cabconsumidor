import 'package:cabproject/app/core/models/transaction_model.dart';
import 'package:cabproject/app/modules/deposit/deposit_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class DepositStore extends Store<TransactionModel> {
  DepositStore() : super(TransactionModel());

  final DepositRepository _repository = Modular.get();

  Future<void> depositAmount(
    String userId,
    TransactionModel transactionModel,
  ) async {
    setLoading(true);
    await _repository.depositAmount(userId, transactionModel).then((value) {
      setLoading(false);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }
}
