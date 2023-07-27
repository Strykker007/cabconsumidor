import 'package:cabproject/app/core/models/seller_model.dart';
import 'package:cabproject/app/core/models/transaction_model.dart';
import 'package:cabproject/app/core/services/firebase_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> payAmount(
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

          if (acc1snap.get('value') < transactionModel.amount) {
            throw Exception('Saldo insuficiente');
          }

          final newAmount = acc1snap.get('value') - transactionModel.amount;

          transaction.update(docRef, {'value': newAmount});
        },
      ).then(
        (value) async {
          DocumentReference docSellerRef = _firestore
              .collection('sellers')
              .doc(transactionModel.stablishmentCode)
              .collection('balance')
              .doc('balance');
          _firestore.runTransaction((transaction) async {
            final accSellersnap = await transaction.get(docSellerRef);

            final newAmount =
                accSellersnap.get('value') - transactionModel.amount;

            transaction.update(docSellerRef, {'value': newAmount});
          });
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

  Future<SellerModel> getSellerData(String sellerCode) async {
    List<SellerModel> sellersList = List.empty(growable: true);
    try {
      await _firestore.collection('sellers').get().then((sellers) {
        for (var element in sellers.docs) {
          SellerModel seller = SellerModel.fromMap(element.data());
          seller.code = element.id;
          sellersList.add(seller);
        }
      });
      return sellersList.firstWhere((element) => element.code == sellerCode);
    } on FirebaseAuthException catch (e) {
      final Exception error = FirebaseExceptions.getErrorException(e);
      throw error;
    }
  }
}
