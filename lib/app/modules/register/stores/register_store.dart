import 'package:cabconsumidor/app/core/models/register_model.dart';
import 'package:cabconsumidor/app/modules/register/register_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class RegisterStore extends Store<RegisterModel> {
  RegisterStore() : super(RegisterModel());

  final RegisterRepository _repository = Modular.get();

  void updateForm(RegisterModel form) {
    update(form, force: true);
  }

  Future<void> registerUser(RegisterModel user) async {
    setLoading(true);
    await _repository.register(user).then((credential) {
      setLoading(false);
    }).catchError(
      (onError) {
        setLoading(false);
      },
    );
  }
}
