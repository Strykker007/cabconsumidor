import 'package:cabproject/app//modules/splash/splash_page.dart';
import 'package:cabproject/app//modules/splash/splash_store.dart';
import 'package:cabproject/app/modules/splash/splash_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashStore()),
    Bind.lazySingleton((i) => SplashRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
  ];
}
