import 'package:cabconsumidor/app/core/models/city_model.dart';
import 'package:cabconsumidor/app/modules/address/address_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class CityListStore extends Store<List<CityModel>> {
  CityListStore() : super(List.empty(growable: true));
  final AddressRepository _repository = Modular.get();
  CityModel? selectedCity = CityModel();

  void clearFilters() {
    selectedCity = CityModel();
    update([]);
  }

  Future<void> getCities(int countryId) async {
    setLoading(true);
    await _repository.getCities(countryId).then((cities) {
      update(cities);

      setLoading(false);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }

  Future<void> selectCity(CityModel city) async {
    selectedCity = city;
    update(state, force: true);
  }
}
