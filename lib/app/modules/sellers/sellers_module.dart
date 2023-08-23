import 'package:cabconsumidor/app/modules/sellers/pages/seller_details_page.dart';
import 'package:cabconsumidor/app/modules/sellers/pages/sellers_page.dart';
import 'package:cabconsumidor/app/modules/sellers/sellers_repository.dart';
import 'package:cabconsumidor/app/modules/sellers/sellers_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SellersModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SellersStore()),
    Bind.lazySingleton((i) => SellersRepository(i.get<Dio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => SellersPage(
        title: args.data,
      ),
    ),
    ChildRoute(
      '/seller_details',
      child: (_, args) => SellerDetailsPage(seller: args.data),
    ),
  ];
}
