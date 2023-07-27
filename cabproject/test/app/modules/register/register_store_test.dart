import 'package:flutter_test/flutter_test.dart';
import 'package:cabproject/app/modules/register/stores/register_store.dart';

void main() {
  late RegisterStore store;

  setUpAll(() {
    store = RegisterStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    // store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
