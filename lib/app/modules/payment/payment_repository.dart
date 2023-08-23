// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:cabconsumidor/app/core/models/seller_model.dart';
import 'package:cabconsumidor/app/core/models/transaction_model.dart';

class PaymentRepository {
  final Dio client;
  PaymentRepository(
    this.client,
  );

  Future<void> payAmount(
    TransactionModel payment,
  ) async {
    try {
      await client.post(
        '/pagamento/',
        data: payment.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<SellerModel> getSellerData(String sellerCode) async {
    try {
      final response = await client.get(
        '/vendedor/$sellerCode/',
      );

      return SellerModel.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
