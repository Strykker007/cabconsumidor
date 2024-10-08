import 'dart:developer';

import 'package:cabconsumidor/app/core/models/user_preferences_model.dart';
import 'package:cabconsumidor/app/core/services/preferences_service.dart';
import 'package:dio/dio.dart';

class SplashRepository {
  final Dio _client;

  SplashRepository(this._client);

  Future<UserPreferencesModel> getCurrentUser() async {
    final PreferencesService prefs = PreferencesService();
    final userId = await prefs.getUserId();
    try {
      final usePreferences = await prefs.getUserPreferences(userId!);
      return usePreferences!;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> verifyToken(String token) async {
    try {
      final reponse = await _client.post(
        '/consumidor/tokne-verify/',
        data: {
          'token': token,
        },
      );
      log('verificou');
    } catch (e) {
      rethrow;
    }
  }
}
