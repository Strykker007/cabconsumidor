import 'package:cabproject/app/modules/address/address_page.dart';
import 'package:cabproject/app/modules/address/address_repository.dart';
import 'package:cabproject/app/modules/address/address_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddressModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AddressStore()),
    Bind.lazySingleton((i) => AddressRepository(i.get<Dio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AddressPage()),
  ];
}
