import 'package:cabconsumidor/app/modules/auth/pages/auth_page.dart';
import 'package:cabconsumidor/app/modules/auth/stores/auth_store.dart';
import 'package:cabconsumidor/app/core/stores/obscure_store.dart';
import 'package:cabconsumidor/app/modules/auth/pages/presentation_page.dart';
import 'package:cabconsumidor/app/modules/auth/stores/remind_password_store.dart';
import 'package:cabconsumidor/app/modules/home/home_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind.lazySingleton((i) => AuthStore()),
    Bind.lazySingleton((i) => ObscureStore()),
    Bind.lazySingleton((i) => RemindPasswordStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/home', module: HomeModule()),
    ChildRoute('/login', child: (_, args) => const AuthPage()),
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const PresentationPage(),
    ),
  ];
}
