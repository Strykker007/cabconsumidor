import 'package:cabconsumidor/app/modules/profile/pages/profile_page.dart';
import 'package:cabconsumidor/app/modules/profile/profile_repository.dart';
import 'package:cabconsumidor/app/modules/profile/profile_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProfileStore()),
    Bind.lazySingleton((i) => ProfileRepository(i.get<Dio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const ProfilePage()),
  ];
}
