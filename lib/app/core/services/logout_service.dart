import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutService {
  static Future<void> logout() async {
    await SharedPreferences.getInstance().then(
      (prefs) async {
        prefs.clear();

        Modular.to.popUntil(ModalRoute.withName('/'));
        Modular.to.pushNamed('/');
      },
    );
  }
}
