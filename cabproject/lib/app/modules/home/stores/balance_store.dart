import 'package:cabproject/app/modules/home/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class BalanceStore extends Store<num> {
  BalanceStore() : super(0);
  final HomeRepository _repository = Modular.get();

  Future<void> getBalanceValue(String userId) async {
    setLoading(true);
    await _repository.getBalanceValue(userId).then(
      (value) {
        update(value, force: true);
        setLoading(false);
      },
    ).catchError(
      (onError) {
        setLoading(false);

        throw onError;
      },
    );
  }
}
