import 'package:cabconsumidor/app/core/models/user_model.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/profile/profile_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:image_picker/image_picker.dart';

class ProfileStore extends Store<int> {
  ProfileStore() : super(0);
  final UserStore userStore = Modular.get();

  final ProfileRepository _repository = Modular.get();

  Future<void> updateUserProfile(String userId, UserModel user) async {
    setLoading(true);
    await _repository.updateUserProfile(userId, user).then((value) {
      userStore.state.user = user;
      userStore.update(userStore.state);
      setLoading(false);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }

  Future<void> getUserData(String userId) async {
    setLoading(true);
    setLoading(false);
    // await _repository.getUserData(userId).then((user) {
    //   userStore.update(user);
    //   setLoading(false);
    // }).catchError((onError) {
    //   setLoading(false);
    //   throw onError;
    // });
  }

  Future<void> updateUserPhoto(String userId, XFile? file) async {
    userStore.setLoading(true);
    // await _repository.updateUserPhoto(userId, file).then((user) {
    //   userStore.setLoading(false);
    // }).catchError((onError) {
    //   userStore.setLoading(false);
    //   throw onError;
    // });
    userStore.setLoading(false);
  }
}
