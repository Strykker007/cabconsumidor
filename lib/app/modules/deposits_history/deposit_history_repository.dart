import 'package:cabconsumidor/app/core/models/deposit_history_model.dart';
import 'package:dio/dio.dart';

import 'package:cabconsumidor/app/core/models/seller_model.dart';

class DepositHistoryRepository {
  final Dio client;
  DepositHistoryRepository(
    this.client,
  );

  Future<List<DepositHistoryModel>> getDepositHistoryList() async {
    try {
      // final locationData = await locationService.getLocationData();
      // params.latitude = locationData!.latitude;
      // params.longitude = locationData.longitude;
      final response = await client.get(
        '/deposito/',
        data: {'id_consumidor': 3},
      );
      List<DepositHistoryModel> deposits = List.empty(growable: true);

      response.data.forEach((deposit) {
        deposits.add(DepositHistoryModel.fromMap(deposit));
      });
      return deposits;
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
