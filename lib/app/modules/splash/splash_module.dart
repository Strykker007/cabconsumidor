import 'package:cabconsumidor/app//modules/splash/splash_page.dart';
import 'package:cabconsumidor/app//modules/splash/splash_store.dart';
import 'package:cabconsumidor/app/core/interceptors/auth_interceptor.dart';
import 'package:cabconsumidor/app/modules/splash/splash_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashStore()),
    Bind.lazySingleton((i) => SplashRepository(
          Dio(
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
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
  ];
}
