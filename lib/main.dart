import 'dart:developer';

import 'package:cabconsumidor/app/core/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load().catchError(
    (onError) {
      log('Erro ao carregar dotenv ${onError.toString()}');
    },
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .catchError((onError) {
    return Firebase.app();
  });

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
