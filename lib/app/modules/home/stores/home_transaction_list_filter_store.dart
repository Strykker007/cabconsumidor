import 'package:flutter_triple/flutter_triple.dart';

class HomeTransactionListFilterStore extends Store<int> {
  HomeTransactionListFilterStore() : super(7);

  void updateFilter() {
    if (state == 7) {
      update(15, force: true);
    } else if (state == 15) {
      update(30, force: true);
    } else if (state == 30) {
      update(60, force: true);
    } else {
      update(7, force: true);
    }
  }
}
