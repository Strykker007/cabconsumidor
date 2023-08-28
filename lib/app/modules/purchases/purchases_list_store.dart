import 'package:cabconsumidor/app/core/models/purchase_model.dart';
import 'package:cabconsumidor/app/modules/purchases/purchases_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PurchasesStore extends Store<List<PurchaseModel>> {
  PurchasesStore() : super([]);

  final PurchasesRepository _repository = Modular.get();
  // final SellerQueryParamsModel params = SellerQueryParamsModel();

  Future<void> getPurchasesList() async {
    setLoading(true);
    await _repository.getPurchasesList().then((purchases) {
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
