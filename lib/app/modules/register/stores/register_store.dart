import 'package:cabconsumidor/app/core/models/register_model.dart';
import 'package:cabconsumidor/app/core/stores/obscure_store.dart';
import 'package:cabconsumidor/app/modules/register/register_repository.dart';
import 'package:cabconsumidor/app/modules/register/stores/checkbox_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class RegisterStore extends Store<RegisterModel> {
  RegisterStore() : super(RegisterModel());

  final RegisterRepository _repository = Modular.get();
  final CheckboxStore checkboxStore = Modular.get();

  final ObscureStore obscureStore = ObscureStore();
  bool registerButtonDisabled = true;

  void updateForm(RegisterModel form) {
    validateEmptyFields();
    update(form, force: true);
  }

  void obscurePassword() {
    obscureStore.updateState(!obscureStore.state);
  }

  void validateEmptyFields() {
    if (state.name!.isNotEmpty &&
        state.cpf!.isNotEmpty &&
        state.email!.isNotEmpty &&
        state.phone!.isNotEmpty &&
        state.birthDate!.isNotEmpty &&
        state.password!.isNotEmpty &&
        checkboxStore.state) {
      registerButtonDisabled = false;
    } else {
      registerButtonDisabled = true;
    }
  }

  Future<void> registerUser(RegisterModel user) async {
    setLoading(true);
    await _repository.register(user).then((credential) {
      setLoading(false);
    }).catchError(
      (onError) {
        setLoading(false);
        throw onError;
      },
    );
  }
}
