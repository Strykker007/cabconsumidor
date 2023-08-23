import 'package:cabconsumidor/app/core/models/address_model.dart';
import 'package:cabconsumidor/app/core/models/user_model.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/address/address_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AddressStore extends Store<AddressModel> {
  AddressStore() : super(AddressModel());

  final AddressRepository _repository = Modular.get();
  final UserStore userStore = Modular.get();

  Future<void> updateUserProfile(String userId, UserModel user) async {
    setLoading(true);
    await _repository.updateUserProfile(userId, user).then((value) {
      userStore.state.user!;
      userStore.update(userStore.state);
      setLoading(false);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }
}
