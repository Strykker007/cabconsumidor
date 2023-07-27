import 'package:dio/dio.dart';

import 'package:cabproject/app/core/models/user_model.dart';

class ProfileRepository {
  final Dio client;
  ProfileRepository(
    this.client,
  );

  Future<void> updateUserProfile(String userId, UserModel user) async {
    try {
      await client.put(
        '/user/$userId/',
        data: user.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  // Future<UserModel> getUserData(String userId) async {
  //   try {
  //     final DocumentSnapshot<Map<String, dynamic>> doc =
  //         await _firebaseFirestore.collection('users').doc(userId).get();
  //     return UserModel.fromMap(doc.data()!);
  //   } on FirebaseAuthException catch (e) {
  //     final Exception error = FirebaseExceptions.getErrorException(e);
  //     throw error;
  //   }
  // }

  // Future<String> updateUserPhoto(String userId, XFile? file) async {
  //   try {
  //     final metadata = SettableMetadata(
  //       contentType: 'image/jpeg',
  //       customMetadata: {'picked-file-path': file!.path},
  //     );

  //     Reference ref =
  //         _storage.ref().child('users').child(userId).child(file.name);
  //     await ref.putFile(io.File(file.path), metadata);

  //     final String url = await ref.getDownloadURL();

  //     await firebaseAuth.currentUser!.updatePhotoURL(url);

  //     return ref.getDownloadURL();
  //   } on FirebaseAuthException catch (e) {
  //     final Exception error = FirebaseExceptions.getErrorException(e);
  //     throw error;
  //   }
  // }
}
