import 'package:cabconsumidor/app/core/interceptors/auth_interceptor.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/auth/auth_module.dart';
import 'package:cabconsumidor/app/modules/auth/auth_repository.dart';
import 'package:cabconsumidor/app/modules/home/stores/obscure_balance_store.dart';
import 'package:cabconsumidor/app/modules/register/register_module.dart';
import 'package:cabconsumidor/app/modules/splash/splash_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UserStore()),
    Bind.lazySingleton((i) => AuthRepository()),
    Bind.lazySingleton((i) => ObscureBalanceStore()),
    Bind.lazySingleton(
      (i) => Dio(
        BaseOptions(
          baseUrl: dotenv.env['BASE_URL']! + dotenv.env['API_VERSION']!,
          connectTimeout: Duration(
            milliseconds: int.parse(dotenv.env['TIMEOUT']!),
          ),
        ),
      )..interceptors.addAll(
          [
            AuthInterceptor(),
            LogInterceptor(
              responseHeader: false,
              responseBody: true,
              error: false,
            ),
          ],
        ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/register', module: RegisterModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
