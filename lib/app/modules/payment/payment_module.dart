import 'package:cabconsumidor/app/modules/payment/pages/payment_page.dart';
import 'package:cabconsumidor/app/modules/payment/pages/success_payment_page.dart';
import 'package:cabconsumidor/app/modules/payment/payment_repository.dart';
import 'package:cabconsumidor/app/modules/payment/payment_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaymentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PaymentStore()),
    Bind.lazySingleton((i) => PaymentRepository(i.get<Dio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => PaymentPage(
              seller: args.data['vendedor'],
              title: args.data['title'],
            )),
    ChildRoute(
      '/sucess_payment_page',
      child: (_, args) => const SuccessPaymentPage(),
    ),
  ];
}
