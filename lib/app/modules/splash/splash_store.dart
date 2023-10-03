import 'package:cabconsumidor/app/core/services/preferences_service.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/splash/splash_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SplashStore extends Store<int> {
  SplashStore() : super(0);

  final SplashRepository _repository = Modular.get();
  final UserStore userStore = Modular.get();

  Future<void> getUserSession() async {
    // if (userId == null) return;
    await _repository.getCurrentUser().then((user) async {
      userStore.update(user);
      await _repository.verifyToken(user.jwt!.token!).catchError((onError) {});
    }).catchError((onError) {
      throw onError;
    });
  }
}
