import 'package:flutter_triple/flutter_triple.dart';

class ObscureBalanceStore extends Store<bool> {
  ObscureBalanceStore() : super(false);

  void updateState(bool state) {
    update(state, force: true);
  }
}
