import 'package:cabproject/app/core/interceptors/auth_interceptor.dart';
import 'package:cabproject/app/modules/config/config_module.dart';
import 'package:cabproject/app/modules/deposit/deposit_module.dart';
import 'package:cabproject/app/modules/home/home_repository.dart';

import 'package:cabproject/app/modules/home/stores/balance_store.dart';
import 'package:cabproject/app/modules/home/stores/obscure_balance_store.dart';
import 'package:cabproject/app/modules/notifications/notifications_module.dart';
import 'package:cabproject/app/modules/payment/payment_module.dart';
import 'package:cabproject/app/modules/profile/profile_module.dart';
import 'package:cabproject/app/modules/sellers/sellers_module.dart';
import 'package:cabproject/app/modules/transactions/transactions_module.dart';
import 'package:cabproject/app/modules/transactions/transactions_repository.dart';
import 'package:cabproject/app/modules/transactions/transactions_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => Dio(
        BaseOptions(
          baseUrl: dotenv.env['BASE_URL']! + dotenv.env['API_VERSION']!,
          connectTimeout: Duration(
            milliseconds: int.parse(dotenv.env['TIMEOUT']!),
          ),
        ),
      )..interceptors.addAll(
          [
            AuthInterceptor(),
            LogInterceptor(
              responseHeader: false,
              responseBody: true,
              error: false,
            ),
          ],
        ),
    ),
    Bind.lazySingleton((i) => BalanceStore()),
    Bind.lazySingleton((i) => ObscureBalanceStore()),
    Bind.lazySingleton((i) => HomeRepository()),
    Bind.lazySingleton((i) => TransactionsStore()),
    Bind.lazySingleton((i) => TransactionsRepository(i.get<Dio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ModuleRoute('/config', module: ConfigModule()),
    ModuleRoute('/deposit', module: DepositModule()),
    ModuleRoute('/profile', module: ProfileModule()),
    ModuleRoute('/transactions', module: TransactionsModule()),
    ModuleRoute('/sellers', module: SellersModule()),
    ModuleRoute('/notifications', module: NotificationsModule()),
    ModuleRoute('/payment', module: PaymentModule()),
  ];
}
