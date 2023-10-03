import 'package:cabconsumidor/app/core/interceptors/auth_interceptor.dart';
import 'package:cabconsumidor/app/modules/config/config_module.dart';
import 'package:cabconsumidor/app/modules/deposit/deposit_module.dart';
import 'package:cabconsumidor/app/modules/deposits_history/deposit_history_module.dart';
import 'package:cabconsumidor/app/modules/home/home_repository.dart';

import 'package:cabconsumidor/app/modules/home/stores/balance_store.dart';
import 'package:cabconsumidor/app/modules/home/stores/home_transaction_list_filter_store.dart';
import 'package:cabconsumidor/app/modules/notifications/notifications_module.dart';
import 'package:cabconsumidor/app/modules/payment/payment_module.dart';
import 'package:cabconsumidor/app/modules/profile/profile_module.dart';
import 'package:cabconsumidor/app/modules/purchases/purchases_module.dart';
import 'package:cabconsumidor/app/modules/sellers/sellers_module.dart';
import 'package:cabconsumidor/app/modules/transactions/transactions_module.dart';
import 'package:cabconsumidor/app/modules/transactions/transactions_repository.dart';
import 'package:cabconsumidor/app/modules/transactions/stores/transactions_store.dart';
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
    Bind.lazySingleton((i) => HomeTransactionListFilterStore()),
    Bind.lazySingleton((i) => HomeRepository(i.get<Dio>())),
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
    ModuleRoute('/purchases', module: PurchasesModule()),
    ModuleRoute('/depositsHistory', module: DepositHistoryModule()),
  ];
}
