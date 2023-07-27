import 'package:cabproject/app/core/models/user_model.dart';
import 'package:cabproject/app/core/services/firebase_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getCurrentUser(String userId) async {
    try {
      final response = await _firestore.collection('users').doc(userId).get();
      return UserModel.fromMap(response.data()!);
    } on FirebaseAuthException catch (e) {
      final Exception error = FirebaseExceptions.getErrorException(e);
      throw error;
    }
  }
}
