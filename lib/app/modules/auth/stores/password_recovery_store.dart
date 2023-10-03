import 'package:cabconsumidor/app/modules/auth/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PasswordRecoveryStore extends Store<String> {
  PasswordRecoveryStore() : super('');

  final AuthRepository _repository = Modular.get();

  void updateState(String email) {
    update(email, force: true);
  }

  Future<void> passwordRecovery(String email) async {
    setLoading(true);

    await _repository.passwordRecovery(email).then(
      (value) {
        setLoading(false);
      },
    ).catchError(
      (onError) {
        setLoading(false);
        throw onError;
      },
    );
  }
}
