import 'package:cabconsumidor/app/core/models/deposit_history_model.dart';
import 'package:cabconsumidor/app/modules/deposits_history/deposit_history_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../core/models/transaction_params_model.dart';
import '../../core/stores/user_store.dart';
import '../../core/utils/formaters.dart';

class DepositHistoryStore extends Store<List<DepositHistoryModel>> {
  DepositHistoryStore() : super([]);

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

  final UserStore userStore = Modular.get();
  late TransactionParamsModel params;

  final DepositHistoryRepository _repository = Modular.get();
  // final SellerQueryParamsModel params = SellerQueryParamsModel();

  Future<void> getDepositHistoryList() async {
    setLoading(true);
    await _repository.getDepositHistoryList(params).then((deposits) {
      setLoading(false);
      update(deposits);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }

  // Future<void> getSellersListByName(String name) async {
  //   setLoading(true);
  //   await _repository.getSellersListByName(name).then((sellers) {
  //     setLoading(false);
  //     update(sellers);
  //   }).catchError((onError) {
  //     setLoading(false);
  //     throw onError;
  //   });
  // }
}
