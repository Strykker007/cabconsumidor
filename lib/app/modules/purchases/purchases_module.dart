import 'package:cabconsumidor/app/modules/purchases/purchases_list_store.dart';
import 'package:cabconsumidor/app/modules/purchases/purchases_page.dart';
import 'package:cabconsumidor/app/modules/purchases/purchases_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PurchasesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PurchasesStore()),
    Bind.lazySingleton((i) => PurchasesRepository(i.get<Dio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => PurchasesPage(
        title: args.data,
      ),
    ),
  ];
}
