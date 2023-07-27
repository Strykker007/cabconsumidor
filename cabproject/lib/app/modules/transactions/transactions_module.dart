import 'package:cabproject/app/modules/transactions/transactions_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TransactionsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => TransactionsPage(title: args.data)),
  ];
}
