import 'package:cabproject/app/core/models/transaction_model.dart';
import 'package:cabproject/app/core/services/firebase_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DepositRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> depositAmount(
    String userId,
    TransactionModel transactionModel,
  ) async {
    transactionModel.userId = userId;
    try {
      DocumentReference docRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('balance')
          .doc('balance');
      await _firestore.runTransaction(
        (transaction) async {
          final acc1snap = await transaction.get(docRef);

          final newAmount = acc1snap.get('value') + transactionModel.amount;

          transaction.update(docRef, {'value': newAmount});
        },
      ).then(
        (value) async {
          transactionModel.date = DateTime.now();
          await _firestore
              .collection('transactions')
              .doc()
              .set(transactionModel.toMap());
        },
      );
    } on FirebaseAuthException catch (e) {
      final Exception error = FirebaseExceptions.getErrorException(e);
      throw error;
    }
  }
}
