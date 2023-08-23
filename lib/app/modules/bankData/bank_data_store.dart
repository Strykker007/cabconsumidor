import 'package:cabconsumidor/app/core/models/bank_data_model.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/bankData/bank_data_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class BankDataStore extends Store<BankDataModel> {
  BankDataStore() : super(BankDataModel());

  final UserStore userStore = Modular.get();
  final BankDataRepository _repository = Modular.get();

  Future<void> updateBankData(BankDataModel bankData) async {
    setLoading(true);
    await _repository.updateBankData(bankData).then((userUpdated) {
      setLoading(false);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }

  Future<void> getBankData(String userId) async {
    setLoading(true);
    await _repository.getBankData(userId).then((bankData) {
      setLoading(false);
      update(bankData);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }
}
