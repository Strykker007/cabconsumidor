import 'package:cabproject/app/core/models/credential_model.dart';
import 'package:cabproject/app/core/models/user_preferences_model.dart';
import 'package:cabproject/app/core/services/preferences_service.dart';
import 'package:cabproject/app/core/stores/obscure_store.dart';
import 'package:cabproject/app/core/stores/user_store.dart';
import 'package:cabproject/app/modules/auth/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthStore extends Store<bool> {
  final ObscureStore obscureStore = Modular.get();
  final UserStore userStore = Modular.get();
  final AuthRepository _authRepository = Modular.get();
  late CredentialModel credentialModel = CredentialModel();
  final PreferencesService service = PreferencesService();
  AuthStore() : super(true);

  void obscurePassword() {
    obscureStore.updateState(!obscureStore.state);
  }

  Future<void> recoverPassword(String email) async {
    // obscureStore.updateState(!obscureStore.state);
  }
  Future<void> authenticate(CredentialModel credential) async {
    setLoading(true);
    await _authRepository.authenticate(credential).then((jwt) async {
      await _authRepository
          .getUserById(jwt!.token!, jwt.id.toString())
          .then((user) async {
        final UserPreferencesModel userPreferences = UserPreferencesModel();
        userPreferences.user = user!;
        userPreferences.jwt = jwt;
        await service.setUserPreferences(userPreferences);

        userStore.update(userPreferences);
      });
      setLoading(false);
    }).catchError(
      (onError) {
        setLoading(false);
        throw onError;
      },
    );
  }
}
