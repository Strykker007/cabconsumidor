import 'package:flutter_triple/flutter_triple.dart';

class DateFilterStore extends Store<int> {
  DateFilterStore() : super(30);

  void updateFilter(int value) {
    update(value, force: true);
  }
}
