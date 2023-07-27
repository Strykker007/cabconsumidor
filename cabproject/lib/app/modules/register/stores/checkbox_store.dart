import 'package:flutter_triple/flutter_triple.dart';

class CheckboxStore extends Store<bool> {
  CheckboxStore() : super(false);

  void updateState(bool state) {
    update(state, force: true);
  }
}
