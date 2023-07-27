import 'package:cabproject/app/core/models/user_model.dart';
import 'package:cabproject/app/core/services/firebase_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BankDataRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> updateBankData(String userId, UserModel user) async {
    try {
      await _firestore.collection('users').doc(userId).update(user.toMap());
      return user;
    } on FirebaseAuthException catch (e) {
      final Exception error = FirebaseExceptions.getErrorException(e);
      throw error;
    }
  }
}
