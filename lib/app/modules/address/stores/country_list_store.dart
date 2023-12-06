import 'package:cabconsumidor/app/core/models/country_model.dart';
import 'package:cabconsumidor/app/modules/address/address_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class CountryListStore extends Store<List<CountryModel>> {
  CountryListStore() : super([]);
  final AddressRepository _repository = Modular.get();
  CountryModel? selectedCountry = CountryModel();

  Future<void> getCountries() async {
    setLoading(true);
    await _repository.getCountries().then((countries) {
      update(countries);

      setLoading(false);
    }).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }

  Future<void> selectCountry(CountryModel country) async {
    selectedCountry = country;
    update(state, force: true);
  }
}
