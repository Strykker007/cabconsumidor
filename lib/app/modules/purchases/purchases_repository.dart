import 'package:cabconsumidor/app/core/models/purchase_model.dart';
import 'package:cabconsumidor/app/core/models/transaction_params_model.dart';
import 'package:dio/dio.dart';

import 'package:cabconsumidor/app/core/models/seller_model.dart';

class PurchasesRepository {
  final Dio client;
  PurchasesRepository(
    this.client,
  );

  Future<List<PurchaseModel>> getPurchasesList(
      TransactionParamsModel params) async {
    try {
      // final locationData = await locationService.getLocationData();
      // params.latitude = locationData!.latitude;
      // params.longitude = locationData.longitude;
      final response = await client.get(
        '/compras/',
        data: params.toMap(),
      );
      List<PurchaseModel> purchases = List.empty(growable: true);

      response.data.forEach((purchase) {
        purchases.add(PurchaseModel.fromMap(purchase));
      });
      return purchases;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SellerModel>> getSellersListByName(String name) async {
    final List<SellerModel> sellers = List.empty(growable: true);

    try {
      final response = await client.get(
        '/vendedor/',
        queryParameters: {'nome': name},
      );

      response.data.forEach((seller) {
        sellers.add(SellerModel.fromMap(seller));
      });
      return sellers;
    } catch (e) {
      rethrow;
    }
  }
}
