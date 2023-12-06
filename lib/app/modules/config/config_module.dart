import 'package:cabconsumidor/app//modules/profile/profile_module.dart';
import 'package:cabconsumidor/app/modules/address/address_module.dart';
import 'package:cabconsumidor/app/modules/bankData/bank_data_module.dart';
import 'package:cabconsumidor/app/modules/change_password/change_password_module.dart';
import 'package:cabconsumidor/app/modules/config/config_repository.dart';
import 'package:cabconsumidor/app/modules/config/stores/config_store.dart';
import 'package:cabconsumidor/app/modules/config/stores/version_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:cabconsumidor/app/modules/config/config_page.dart';

class ConfigModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => VersionStore()),
    Bind((i) => ConfigStore()),
    Bind((i) => ConfigRepository(i.get<Dio>())),
  ];

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
