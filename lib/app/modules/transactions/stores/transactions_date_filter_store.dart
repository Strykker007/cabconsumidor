import 'package:flutter_triple/flutter_triple.dart';

class TransactionsDateFilterStore extends Store<int> {
  TransactionsDateFilterStore() : super(30);

  void updateFilter(int value) {
    update(value, force: true);
  }
}
