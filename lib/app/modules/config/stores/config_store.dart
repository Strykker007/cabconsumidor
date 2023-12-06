import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/config/config_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ConfigStore extends Store<bool> {
  ConfigStore() : super(false);

  final UserStore userStore = Modular.get();
  final ConfigRepository _repository = Modular.get();

  Future<void> deleteUser() async {
    setLoading(true);
    await _repository.deleteUser(userStore.state.user!.userId.toString()).then(
      (value) {
        setLoading(false);
      },
    ).catchError(
      (onError) {
        setLoading(false);
        throw onError;
      },
    );
    setLoading(false);
  }
}
