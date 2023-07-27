import 'package:flutter_test/flutter_test.dart';
import 'package:cabproject/app//modules/deposit/deposit_store.dart';

void main() {
  late DepositStore store;

  setUpAll(() {
    store = DepositStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    // store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
