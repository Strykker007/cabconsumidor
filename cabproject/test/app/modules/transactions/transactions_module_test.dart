import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cabproject/app/modules/transactions/transactions_module.dart';

void main() {
  setUpAll(() {
    initModule(TransactionsModule());
  });
}
