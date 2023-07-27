import 'package:flutter_test/flutter_test.dart';
import 'package:cabproject/app/modules/change_password/change_password_store.dart';

void main() {
  late ChangePasswordStore store;

  setUpAll(() {
    store = ChangePasswordStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
