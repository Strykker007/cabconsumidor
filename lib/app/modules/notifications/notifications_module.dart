import 'package:cabconsumidor/app/modules/notifications/notifications_page.dart';
import 'package:cabconsumidor/app//modules/notifications/notifications_store.dart';
import 'package:cabconsumidor/app/modules/notifications/notifications_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotificationsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NotificationsStore()),
    Bind.lazySingleton((i) => NotificationsRepository(i.get<Dio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => NotificationsPage(title: args.data)),
  ];
}
