import 'package:cabconsumidor/app/core/models/seller_model.dart';
import 'package:cabconsumidor/app/core/models/transaction_model.dart';
import 'package:cabconsumidor/app/modules/payment/payment_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PaymentStore extends Store<bool> {
  PaymentStore() : super(false);

  final PaymentRepository _repository = Modular.get();
  SellerModel? seller;

  Future<void> payAmount(
    TransactionModel payment,
  ) async {
    setLoading(true);
    await _repository.payAmount(payment).then((value) {
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
    seller = SellerModel();
    await _repository.getSellerData(sellerCode).then((sellerModel) {
      seller = sellerModel;
      setLoading(false);
    }).catchError((onError) {
      setLoading(false);
      setError(onError);
    });
  }
}
