import 'package:cabconsumidor/app/modules/deposit/pages/deposit_page.dart';
import 'package:cabconsumidor/app//modules/deposit/deposit_store.dart';
import 'package:cabconsumidor/app/modules/deposit/deposit_repository.dart';
import 'package:cabconsumidor/app/modules/deposit/pages/success_deposit_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DepositModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DepositStore()),
    Bind.lazySingleton((i) => DepositRepository(i.get<Dio>())),
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
