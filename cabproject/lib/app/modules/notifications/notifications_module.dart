import 'package:cabproject/app/modules/notifications/notifications_page.dart';
import 'package:cabproject/app//modules/notifications/notifications_store.dart';
import 'package:cabproject/app/modules/notifications/notifications_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotificationsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NotificationsStore()),
    Bind.lazySingleton((i) => NotificationsRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => NotificationsPage(title: args.data)),
  ];
}
