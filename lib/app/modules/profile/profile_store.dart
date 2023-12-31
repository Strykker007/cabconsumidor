import 'package:cabconsumidor/app/core/models/photo_model.dart';
import 'package:cabconsumidor/app/core/models/user_model.dart';
import 'package:cabconsumidor/app/core/services/preferences_service.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/profile/profile_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mime/mime.dart';

class ProfileStore extends Store<int> {
  ProfileStore() : super(0);
  final UserStore userStore = Modular.get();

  final ProfileRepository _repository = Modular.get();
  final PreferencesService service = PreferencesService();

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

  Future<void> getUserData() async {
    setLoading(true);
    await _repository
        .getUserById(
            userStore.state.jwt!.token!, userStore.state.jwt!.id.toString())
        .then((user) async {
      userStore.state.user = user;
      await service.setUserPreferences(userStore.state);

      userStore.update(userStore.state, force: true);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
    setLoading(false);
    // await _repository.getUserData(userId).then((user) {
    //   userStore.update(user);
    //   setLoading(false);
    // }).catchError((onError) {
    //   setLoading(false);
    //   throw onError;
    // });
  }

  Future<void> updateUserPhoto(CroppedFile? file) async {
    PhotoModel model = PhotoModel(userId: userStore.state.user!.userId!);
    setLoading(true);
    final String ext = lookupMimeType(file!.path) ?? '';
    final String b64 = UriData.fromBytes(
      await file.readAsBytes(),
      mimeType: ext,
    ).toString();
    model.photo = b64;

    await _repository.updateUserPhoto(model).then((photo) {
      userStore.state.user!.profilePhoto = photo;
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
    setLoading(false);
  }
}
