import 'package:flutter_triple/flutter_triple.dart';

class ObscureStore extends Store<bool> {
  ObscureStore() : super(true);

  void updateState(bool state) {
    update(state, force: true);
  }
}
