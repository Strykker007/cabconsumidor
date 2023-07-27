import 'package:flutter_test/flutter_test.dart';
import 'package:cabproject/app/modules/address/address_store.dart';

void main() {
  late AddressStore store;

  setUpAll(() {
    store = AddressStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
  });
}
