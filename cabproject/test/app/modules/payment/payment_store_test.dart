import 'package:flutter_test/flutter_test.dart';
import 'package:cabproject/app/modules/payment/payment_store.dart';

void main() {
  late PaymentStore store;

  setUpAll(() {
    store = PaymentStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));

    expect(store.state, equals(1));
  });
}
