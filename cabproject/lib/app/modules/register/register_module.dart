import 'package:cabproject/app//modules/register/register_page.dart';
import 'package:cabproject/app/modules/register/stores/checkbox_store.dart';
import 'package:cabproject/app/modules/register/stores/register_store.dart';
import 'package:cabproject/app/modules/register/register_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore()),
    Bind.lazySingleton((i) => CheckboxStore()),
    Bind.lazySingleton((i) => RegisterRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RegisterPage()),
  ];
}
