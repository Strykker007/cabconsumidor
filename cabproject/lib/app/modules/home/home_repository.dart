import 'package:cabproject/app/core/services/firebase_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<num> getBalanceValue(String userId) async {
    num? balanceValue = 0;
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('balance')
          .doc('balance')
          .get()
          .then((value) {
        balanceValue = value.data()!['value'];
      });
      return balanceValue!;
    } on FirebaseAuthException catch (e) {
      final Exception error = FirebaseExceptions.getErrorException(e);
      throw error;
    }
  }
}
