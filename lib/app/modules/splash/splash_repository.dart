import 'package:cabconsumidor/app/core/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SplashRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getCurrentUser(String userId) async {
    try {
      final response = await _firestore.collection('users').doc(userId).get();
      return UserModel.fromMap(response.data()!);
    } catch (e) {
      rethrow;
    }
  }
}
