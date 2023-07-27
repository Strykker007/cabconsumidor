import 'package:cabproject/app/modules/deposit/pages/deposit_page.dart';
import 'package:cabproject/app//modules/deposit/deposit_store.dart';
import 'package:cabproject/app/modules/deposit/deposit_repository.dart';
import 'package:cabproject/app/modules/deposit/pages/success_deposit_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DepositModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DepositStore()),
    Bind.lazySingleton((i) => DepositRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => DepositPage(
        title: args.data,
      ),
    ),
    ChildRoute(
      '/sucess_deposit_page',
      child: (_, args) => const SuccessDepositPage(),
    ),
  ];
}
