import 'package:cabconsumidor/app/modules/change_password/change_password_page.dart';
import 'package:cabconsumidor/app/modules/change_password/change_password_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChangePasswordModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ChangePasswordStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => ChangePasswordPage(
              title: args.data,
            )),
  ];
}
