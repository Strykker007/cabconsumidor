import 'package:flutter_test/flutter_test.dart';
import 'package:cabproject/app//modules/notifications/notifications_store.dart';

void main() {
  late NotificationsStore store;

  setUpAll(() {
    store = NotificationsStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    expect(store.state, equals(1));
  });
}
