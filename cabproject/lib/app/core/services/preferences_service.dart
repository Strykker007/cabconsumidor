import 'package:cabproject/app/core/models/credential_model.dart';
import 'package:cabproject/app/core/models/user_preferences_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future<void> setUserPreferences(UserPreferencesModel model) async {
    await SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setString('userId', model.user!.userId!.toString());
        prefs.setString(model.user!.userId!.toString(), model.toJson());
      },
    );
  }

  Future<UserPreferencesModel?> getUserPreferences(String userId) async {
    UserPreferencesModel? user;
    await SharedPreferences.getInstance().then(
      (prefs) {
        final response = prefs.getString(userId);
        user = UserPreferencesModel.fromJson(response!);
      },
    );
    return user;
  }

  Future<String?> getUserId() async {
    String? userId;
    await SharedPreferences.getInstance().then(
      (prefs) {
        userId = prefs.getString('userId');
      },
    );
    return userId;
  }

  Future<void> setUserCredential(CredentialModel model) async {
    await SharedPreferences.getInstance().then(
      (prefs) async {
        await prefs.setString('credential', model.toJson());
      },
    );
  }

  Future<void> clearUserCredentialSaved() async {
    await SharedPreferences.getInstance().then(
      (prefs) async {
        await prefs.remove('credential');
      },
    );
  }

  Future<CredentialModel?> getSavedUserCredential() async {
    CredentialModel? credential = CredentialModel();
    await SharedPreferences.getInstance().then(
      (prefs) async {
        final json = prefs.getString('credential');
        if (json != null) {
          credential = CredentialModel.fromJson(json);
        }
      },
    );
    return credential!;
  }
}
