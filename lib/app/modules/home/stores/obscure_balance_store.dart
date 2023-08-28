import 'package:cabconsumidor/app/core/services/preferences_service.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ObscureBalanceStore extends Store<bool> {
  ObscureBalanceStore() : super(false);

  final PreferencesService prefsService = PreferencesService();

  void updateState(bool state) async {
    update(state, force: true);
    await prefsService.saveObscureBalancePreference(state);
  }
}
