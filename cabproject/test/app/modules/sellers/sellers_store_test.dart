import 'package:flutter_test/flutter_test.dart';
import 'package:cabproject/app/modules/sellers/sellers_store.dart';

void main() {
  late SellersStore store;

  setUpAll(() {
    store = SellersStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));

    expect(store.state, equals(1));
  });
}
