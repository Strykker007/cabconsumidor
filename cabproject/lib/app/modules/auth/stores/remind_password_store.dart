import 'package:cabproject/app/core/models/credential_model.dart';
import 'package:cabproject/app/core/services/preferences_service.dart';
import 'package:flutter_triple/flutter_triple.dart';

class RemindPasswordStore extends Store<bool> {
  RemindPasswordStore() : super(false);

  CredentialModel? credential = CredentialModel();
  final PreferencesService _service = PreferencesService();

  void updateState(bool state) {
    update(state, force: true);
  }

  Future<void> getUserCredentialSaved() async {
    credential = await _service.getSavedUserCredential();
  }

  Future<void> setUserCredentialSaved(CredentialModel model) async {
    await _service.setUserCredential(model);
  }

  Future<void> clearUserCredentialSaved() async {
    await _service.clearUserCredentialSaved();
  }
}
