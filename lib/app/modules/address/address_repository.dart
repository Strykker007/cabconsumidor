import 'package:cabconsumidor/app/core/models/city_model.dart';
import 'package:cabconsumidor/app/core/models/country_model.dart';
import 'package:dio/dio.dart';

import 'package:cabconsumidor/app/core/models/user_model.dart';

class AddressRepository {
  final Dio client;
  AddressRepository(
    this.client,
  );
  Future<void> updateUserProfile(String userId, UserModel user) async {
    try {
      await client.put(
        '/user/$userId/',
        data: user.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CountryModel>> getCountries() async {
    final List<CountryModel> countries = List.empty(growable: true);
    try {
      final response = await client.get(
        '/estado/',
      );
      response.data.forEach(
        (element) {
          countries.add(CountryModel.fromMap(element));
        },
      );
      return countries;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CityModel>> getCities(int countryId) async {
    final List<CityModel> countries = List.empty(growable: true);
    try {
      final response = await client.get(
        '/estado/$countryId',
      );
      response.data['cidades'].forEach(
        (element) {
          countries.add(CityModel.fromMap(element));
        },
      );
      return countries;
    } catch (e) {
      rethrow;
    }
  }
}
