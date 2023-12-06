import 'package:cabconsumidor/app/modules/address/address_page.dart';
import 'package:cabconsumidor/app/modules/address/address_store.dart';

import 'package:flutter_modular/flutter_modular.dart';

class AddressModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AddressStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => AddressPage(
        title: args.data,
      ),
    ),
  ];
}
