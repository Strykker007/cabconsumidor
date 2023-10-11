import 'package:cabconsumidor/app/core/models/purchase_model.dart';
import 'package:cabconsumidor/app/core/models/transaction_params_model.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/purchases/purchases_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../core/utils/formaters.dart';

class PurchasesStore extends Store<List<PurchaseModel>> {
  PurchasesStore() : super([]);

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

  final PurchasesRepository _repository = Modular.get();
  final UserStore userStore = Modular.get();
  late TransactionParamsModel params;
  // final SellerQueryParamsModel params = SellerQueryParamsModel();

  Future<void> getPurchasesList() async {
    setLoading(true);
    await _repository.getPurchasesList(params).then((purchases) {
      setLoading(false);
      update(purchases);
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
