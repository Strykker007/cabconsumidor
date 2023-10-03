import 'package:cabconsumidor/app/core/models/seller_query_params_model.dart';
import 'package:cabconsumidor/app/core/services/location_service.dart';
import 'package:dio/dio.dart';

import 'package:cabconsumidor/app/core/models/seller_model.dart';

class SellersRepository {
  final Dio client;
  SellersRepository(
    this.client,
  );

  final LocationService locationService = LocationService();

  Future<List<SellerModel>> getSellersList(
    SellerQueryParamsModel params,
  ) async {
    try {
      // final locationData = await locationService.getLocationData();
      // params.latitude = locationData!.latitude;
      // params.longitude = locationData.longitude;
      final response = await client.get(
        '/vendedor/',
        queryParameters: params.toMap(),
      );
      List<SellerModel> sellers = List.empty(growable: true);

      response.data.forEach((seller) {
        sellers.add(SellerModel.fromMap(seller));
      });
      return sellers;
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
