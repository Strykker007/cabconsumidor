import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/splash/splash_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SplashStore extends Store<int> {
  SplashStore() : super(0);

  final SplashRepository _repository = Modular.get();
  final UserStore userStore = Modular.get();

  Future<void> getUserSession(String userId) async {
    await _repository.getCurrentUser(userId).then((user) {
      userStore.state.user = user;
      userStore.update(userStore.state);
    }).catchError((onError) {
      throw onError;
    });
  }
}
