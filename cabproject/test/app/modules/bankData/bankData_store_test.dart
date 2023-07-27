import 'package:flutter_test/flutter_test.dart';
import 'package:cabproject/app/modules/bankData/bank_data_store.dart';

void main() {
  late BankDataStore store;

  setUpAll(() {
    store = BankDataStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
  });
}
