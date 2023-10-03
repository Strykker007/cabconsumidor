import 'package:cabconsumidor/app/core/models/credential_model.dart';
import 'package:cabconsumidor/app/core/models/user_preferences_model.dart';
import 'package:cabconsumidor/app/core/services/preferences_service.dart';
import 'package:cabconsumidor/app/core/stores/obscure_store.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/auth/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthStore extends Store<CredentialModel> {
  final ObscureStore obscureStore = Modular.get();
  final UserStore userStore = Modular.get();
  final AuthRepository _authRepository = Modular.get();
  late CredentialModel credentialModel = CredentialModel();
  final PreferencesService service = PreferencesService();
  AuthStore() : super(CredentialModel(username: '', password: ''));

  void obscurePassword() {
    obscureStore.updateState(!obscureStore.state);
  }

  void updateState(CredentialModel model) {
    update(model, force: true);
  }

  bool isValidFields() {
    if (state.username!.isEmpty || state.password!.isEmpty) {
      return true;
    } else {
      return false;
    }
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
