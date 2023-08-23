import 'package:cabconsumidor/app/core/models/deposit_model.dart';
import 'package:cabconsumidor/app/modules/deposit/deposit_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class DepositStore extends Store<DepositModel> {
  DepositStore() : super(DepositModel());

  final DepositRepository _repository = Modular.get();

  void updateForm(DepositModel data) {
    update(DepositModel.fromJson(data.toJson()));
  }

  Future<void> depositAmount(
    DepositModel data,
  ) async {
    setLoading(true);
    data.amount = data.amount!.replaceAll('.', '');
    data.amount = data.amount!.replaceAll(',', '.');
    await _repository.depositAmount(data).then((value) {
      setLoading(false);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }
}
