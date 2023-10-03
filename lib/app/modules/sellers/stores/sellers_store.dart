import 'package:cabconsumidor/app/core/models/seller_model.dart';
import 'package:cabconsumidor/app/modules/sellers/sellers_repository.dart';
import 'package:cabconsumidor/app/modules/sellers/stores/seller_params_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SellersStore extends Store<List<SellerModel>> {
  SellersStore() : super([]);

  final SellersRepository _repository = Modular.get();
  final SellerParamsStore paramsStore = Modular.get();

  Future<void> getSellersList() async {
    setLoading(true);
    await _repository.getSellersList(paramsStore.state).then((sellers) {
      setLoading(false);
      update(sellers);
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
