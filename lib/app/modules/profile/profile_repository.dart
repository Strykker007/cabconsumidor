import 'package:cabconsumidor/app/core/models/photo_model.dart';
import 'package:dio/dio.dart';

import 'package:cabconsumidor/app/core/models/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<UserModel?> getUserById(String token, String userId) async {
    try {
      final response = await client.get(
        '/user/$userId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return UserModel.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getCities() async {
    try {
      await client.put('/cidade/');
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

  Future<String?> updateUserPhoto(PhotoModel photo) async {
    try {
      final Response response = await client.put(
        '/user-img/',
        data: photo.toJson(),
      );
      return dotenv.env['BASE_URL']! + response.data['imagem'];
    } catch (e) {
      rethrow;
    }
  }
}
