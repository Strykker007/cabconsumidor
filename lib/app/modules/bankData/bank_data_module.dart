import 'package:cabconsumidor/app/modules/bankData/bank_data_page.dart';
import 'package:cabconsumidor/app/modules/bankData/bank_data_repository.dart';
import 'package:cabconsumidor/app/modules/bankData/bank_data_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BankDataModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BankDataStore()),
    Bind.lazySingleton((i) => BankDataRepository(i.get<Dio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => BankDataPage(
        title: args.data,
      ),
    ),
  ];
}
