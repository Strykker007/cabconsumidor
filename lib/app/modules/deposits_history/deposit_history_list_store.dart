import 'package:cabconsumidor/app/core/models/deposit_history_model.dart';
import 'package:cabconsumidor/app/modules/deposits_history/deposit_history_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class DepositHistoryStore extends Store<List<DepositHistoryModel>> {
  DepositHistoryStore() : super([]);

  final DepositHistoryRepository _repository = Modular.get();
  // final SellerQueryParamsModel params = SellerQueryParamsModel();

  Future<void> getDepositHistoryList() async {
    setLoading(true);
    await _repository.getDepositHistoryList().then((deposits) {
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
