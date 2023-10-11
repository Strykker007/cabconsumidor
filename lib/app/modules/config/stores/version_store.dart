import 'package:flutter_triple/flutter_triple.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionStore extends Store<String> {
  VersionStore() : super('');

  Future<void> setVersionApp() async {
    PackageInfo.fromPlatform().then(
      (packageInfo) {
        update('${packageInfo.version}.${packageInfo.buildNumber}',
            force: true);
      },
    );
  }
}
