import 'package:cabconsumidor/app/modules/register/pages/register_page.dart';
import 'package:cabconsumidor/app/core/interceptors/auth_interceptor.dart';
import 'package:cabconsumidor/app/modules/register/pages/register_success_page.dart';
import 'package:cabconsumidor/app/modules/register/stores/checkbox_store.dart';
import 'package:cabconsumidor/app/modules/register/stores/register_store.dart';
import 'package:cabconsumidor/app/modules/register/register_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore()),
    Bind.lazySingleton((i) => CheckboxStore()),
    Bind.lazySingleton(
      (i) => RegisterRepository(
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
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const RegisterPage()),
    ChildRoute(
      '/register_success_page',
      child: (_, args) => const RegisterSuccessPage(),
    ),
  ];
}
