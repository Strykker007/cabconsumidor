import 'package:cabproject/app/core/models/seller_model.dart';
import 'package:cabproject/app/core/models/transaction_model.dart';
import 'package:cabproject/app/modules/payment/payment_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PaymentStore extends Store<TransactionModel> {
  PaymentStore() : super(TransactionModel());

  final PaymentRepository _repository = Modular.get();
  SellerModel? seller;

  Future<void> payAmount(
    String userId,
    TransactionModel transactionModel,
  ) async {
    setLoading(true);
    await _repository.payAmount(userId, transactionModel).then((value) {
      setLoading(false);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }

  Future<void> getSellerData(
    String sellerCode,
  ) async {
    setLoading(true);
    await _repository.getSellerData(sellerCode).then((sellerModel) {
      seller = sellerModel;
      setLoading(false);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }
}
