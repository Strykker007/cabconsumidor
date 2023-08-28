import 'package:cabconsumidor/app/modules/deposits_history/deposit_history_list_store.dart';
import 'package:cabconsumidor/app/modules/deposits_history/deposit_history_page.dart';
import 'package:cabconsumidor/app/modules/deposits_history/deposit_history_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DepositHistoryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DepositHistoryStore()),
    Bind.lazySingleton((i) => DepositHistoryRepository(i.get<Dio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => DepositHistoryPage(
        title: args.data,
      ),
    ),
  ];
}
