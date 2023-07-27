import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cabproject/app/modules/change_password/change_password_module.dart';

void main() {
  setUpAll(() {
    initModule(ChangePasswordModule());
  });
}
