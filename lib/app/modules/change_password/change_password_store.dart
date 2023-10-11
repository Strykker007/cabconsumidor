import 'package:cabconsumidor/app/modules/change_password/change_password_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../core/models/change_password_model.dart';

class ChangePasswordStore extends Store<ChangePasswordModel> {
  ChangePasswordStore() : super(ChangePasswordModel());

  final ChangePasswordRepository _repository = Modular.get();

  void updateForm(ChangePasswordModel model) {
    update(model, force: true);
  }

  bool validateFields() {
    if (state.confirmPassword != null &&
        state.oldPassword != null &&
        (state.confirmPassword == state.newPassword)) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> changePassword() async {
    setLoading(true);
    await _repository.changePassword(state).then(
      (value) {
        setLoading(true);
      },
    ).catchError(
      (onError) {
        setLoading(false);
        throw onError;
      },
    );
    setLoading(false);
  }
}
