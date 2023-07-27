import 'package:flutter_test/flutter_test.dart';
import 'package:cabproject/app/modules/transactions/transactions_store.dart';

void main() {
  late TransactionsStore store;

  setUpAll(() {
    store = TransactionsStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));

    expect(store.state, equals(1));
  });
}
