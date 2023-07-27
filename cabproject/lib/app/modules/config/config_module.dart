import 'package:cabproject/app//modules/profile/profile_module.dart';
import 'package:cabproject/app/modules/address/address_module.dart';
import 'package:cabproject/app/modules/bankData/bank_data_module.dart';
import 'package:cabproject/app/modules/change_password/change_password_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:cabproject/app/modules/config/config_page.dart';

class ConfigModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const ConfigPage()),
    ModuleRoute('/profile', module: ProfileModule()),
    ModuleRoute('/address', module: AddressModule()),
    ModuleRoute('/bankData', module: BankDataModule()),
    ModuleRoute('/changePassword', module: ChangePasswordModule()),

    // ChildRoute('/bankData_page', child: (_, args) => const ProfilePage()),
  ];
}
