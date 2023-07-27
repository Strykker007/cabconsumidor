import 'package:cabproject/app/core/models/bank_data_model.dart';
import 'package:cabproject/app/core/models/user_model.dart';
import 'package:cabproject/app/core/stores/user_store.dart';
import 'package:cabproject/app/modules/bankData/bank_data_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class BankDataStore extends Store<BankDataModel> {
  BankDataStore() : super(BankDataModel());

  final UserStore userStore = Modular.get();
  final BankDataRepository _repository = Modular.get();

  Future<void> updateBankData(String userId, UserModel user) async {
    setLoading(true);
    await _repository.updateBankData(userId, user).then((userUpdated) {
      userStore.state.user = userUpdated;
      userStore.update(userStore.state);
      setLoading(false);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }
}
