import 'package:cabproject/app/modules/bankData/bank_data_page.dart';
import 'package:cabproject/app/modules/bankData/bank_data_repository.dart';
import 'package:cabproject/app/modules/bankData/bank_data_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BankDataModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BankDataStore()),
    Bind.lazySingleton((i) => BankDataRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const BankDataPage()),
  ];
}
