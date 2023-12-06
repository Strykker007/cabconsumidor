import 'package:cabconsumidor/app/core/models/city_model.dart';
import 'package:cabconsumidor/app/core/models/country_model.dart';
import 'package:cabconsumidor/app/core/services/helpers.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/bottom_button_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/dropdown/custom_dropdown_button.dart';
import 'package:cabconsumidor/app/core/shared/widgets/error/request_error_widget.dart';
import 'package:cabconsumidor/app/modules/address/stores/city_list_store.dart';
import 'package:cabconsumidor/app/modules/address/stores/country_list_store.dart';
import 'package:cabconsumidor/app/modules/sellers/stores/sellers_store.dart';
import 'package:cabconsumidor/app/modules/sellers/widgets/seller_distance_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SellersFiltersListWidget extends StatefulWidget {
  const SellersFiltersListWidget({super.key});

  @override
  State<SellersFiltersListWidget> createState() =>
      _SellersFiltersListWidgetState();
}

class _SellersFiltersListWidgetState extends State<SellersFiltersListWidget> {
  final SellersStore store = Modular.get();
  final CountryListStore countryStore = CountryListStore();
  final CityListStore cityListStore = CityListStore();

  @override
  void initState() {
    countryStore.getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TripleBuilder(
            store: store.paramsStore,
            builder: (context, triple) {
              return const SellerDistanceSelectorWidget();
            },
          ),
          const SizedBox(width: 15),
          TripleBuilder(
            store: countryStore,
            builder: (context, triple) {
              return CustomDropdownButton(
                store: countryStore,
                isLoading: triple.isLoading,
                dropdownOptions: countryStore.state,
                // selectedOption: countryStore.selectedCountry,
                selectValueText: countryStore.selectedCountry!.name ?? '',
                displayItemName: (item) => item.name!,
                onTap: (selectedValue) async {
                  Modular.to.pop();
                  countryStore.selectedCountry = selectedValue;
                  countryStore.selectCountry(countryStore.selectedCountry!);
                  store.paramsStore.state.country =
                      countryStore.selectedCountry!.id;
                  await store.getSellersList();
                  await cityListStore
                      .getCities(countryStore.selectedCountry!.id!.toInt());
                },
                label: 'Estado',
                clearText: () async {
                  countryStore.selectedCountry = CountryModel();
                  countryStore.selectCountry(countryStore.selectedCountry!);
                  store.paramsStore.state.country = null;
                  cityListStore.clearFilters();
                  await store.getSellersList();
                },
              );
            },
          ),
          const SizedBox(width: 15),
          TripleBuilder(
            store: cityListStore,
            builder: (context, triple) {
              return Visibility(
                visible: cityListStore.state.isNotEmpty,
                child: CustomDropdownButton(
                  store: cityListStore,
                  isLoading: triple.isLoading,
                  dropdownOptions: cityListStore.state,
                  // selectedOption: cityListStore.selectedCountry,
                  selectValueText: cityListStore.selectedCity!.name ?? '',
                  displayItemName: (item) => item.name!,
                  onTap: (selectedValue) async {
                    Modular.to.pop();
                    cityListStore.selectedCity = selectedValue;
                    cityListStore.selectCity(cityListStore.selectedCity!);
                    store.paramsStore.state.country =
                        cityListStore.selectedCity!.id;
                    await store.getSellersList();
                  },
                  label: 'Cidade',
                  clearText: () async {
                    cityListStore.selectedCity = CityModel();
                    cityListStore.selectCity(cityListStore.selectedCity!);
                    store.paramsStore.state.country = null;
                    await store.getSellersList();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
