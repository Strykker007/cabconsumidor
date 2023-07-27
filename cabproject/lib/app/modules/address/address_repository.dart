import 'package:dio/dio.dart';

import 'package:cabproject/app/core/models/user_model.dart';

class AddressRepository {
  final Dio client;
  AddressRepository(
    this.client,
  );
  Future<void> updateUserProfile(String userId, UserModel user) async {
    try {
      await client.put(
        '/user/id/',
        data: user.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
