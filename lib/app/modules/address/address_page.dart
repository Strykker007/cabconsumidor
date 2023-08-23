import 'package:cabconsumidor/app/core/services/formatters.dart';
import 'package:cabconsumidor/app/core/services/helpers.dart';
import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/dropdown/custom_dropdown_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/error/request_error_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabconsumidor/app/core/utils/masks.dart';
import 'package:cabconsumidor/app/modules/address/address_store.dart';
import 'package:cabconsumidor/app/modules/address/stores/city_list_store.dart';
import 'package:cabconsumidor/app/modules/address/stores/country_list_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AddressPage extends StatefulWidget {
  final String title;
  const AddressPage({Key? key, this.title = 'AddressPage'}) : super(key: key);
  @override
  AddressPageState createState() => AddressPageState();
}

class AddressPageState extends State<AddressPage> {
  final AddressStore store = Modular.get();
  final CountryListStore countryStore = Modular.get();
  final CityListStore cityListStore = Modular.get();

  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController streetNameController = TextEditingController();
  final TextEditingController complementController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  @override
  void initState() {
    countryStore.getCountries().then(
      (value) {
        if (countryStore.state.isNotEmpty) {
          countryStore.selectedCountry = countryStore.state.firstWhere(
            (country) => country.id == store.userStore.state.user!.country,
          );
          countryStore.selectCountry(countryStore.selectedCountry!);

          cityListStore.getCities(countryStore.selectedCountry!.id!).then(
            (value) {
              if (cityListStore.state.isNotEmpty) {
                cityListStore.selectedCity = cityListStore.state.firstWhere(
                  (city) => city.id == store.userStore.state.user!.city,
                );
                cityListStore.selectCity(cityListStore.selectedCity!);
              }
            },
          );
        }
      },
    ).catchError((onError) {
      Helpers.showDefaultDialog(
        context,
        RequestErrorWidget(
          error: onError,
          buttonText: 'Fechar',
          onPressed: () {
            Modular.to.pop();
          },
        ),
      );
    });

    zipCodeController.text =
        Formatters.formatCEP(store.userStore.state.user!.postalCode);
    districtController.text = store.userStore.state.user!.neightbor ?? '';
    streetNameController.text = store.userStore.state.user!.street ?? '';
    complementController.text = store.userStore.state.user!.complement ?? '';
    stateController.text = store.userStore.state.user!.country.toString();
    super.initState();
  }

  @override
  void dispose() {
    zipCodeController.clear();
    districtController.clear();
    streetNameController.clear();
    complementController.clear();
    stateController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBarWidget(
          title: widget.title,
          backgroundColor: Colors.transparent,
        ).build(context) as AppBar,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextFormFieldWidget(
                  controller: zipCodeController,
                  inputFormatters: [
                    Masks.generateMask('#####-###'),
                  ],
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                  onChange: (cep) {
                    store.userStore.state.user!.postalCode =
                        cep!.replaceAll('-', '');
                  },
                  keyboardType: TextInputType.number,
                  label: 'CEP',
                  labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                  borderColor: Theme.of(context).primaryColor,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                ),

                //TODO refazer o widget para atualizar o uf
                TripleBuilder(
                  store: countryStore,
                  builder: (_, triple) {
                    return CustomDropdownTextField(
                      label: 'UF',
                      isLoading: triple.isLoading,
                      dropdownOptions: countryStore.state,
                      selectedOption: countryStore.selectedCountry,
                      displayItemName: (state) => state.name!,
                      onChanged: (value) async {
                        store.userStore.state.user!.country = value!.id;
                        countryStore.selectCountry(value);

                        // store.update(store.state);

                        await cityListStore.getCities(value.id!);
                        if (cityListStore.state.isNotEmpty) {
                          cityListStore.selectedCity =
                              cityListStore.state.firstWhere(
                            (city) =>
                                city.id == store.userStore.state.user!.city,
                          );
                          store.userStore.state.user!.city =
                              cityListStore.selectedCity!.id;
                          cityListStore.selectCity(cityListStore.selectedCity!);
                        }
                      },
                    );
                  },
                ),
                TripleBuilder(
                  store: cityListStore,
                  builder: (_, triple) {
                    return CustomDropdownTextField(
                      label: 'CIDADE',
                      isLoading: triple.isLoading,
                      dropdownOptions: cityListStore.state,
                      selectedOption: cityListStore.selectedCity,
                      displayItemName: (state) => state.name!,
                      selectValueText: countryStore.state.isEmpty
                          ? 'Selecione primeiro o Estado'
                          : 'Selecione a cidade',
                      onChanged: (value) {
                        cityListStore.selectCity(value!);
                        store.userStore.state.user!.city = value.id!;
                        store.update(store.state);
                      },
                    );
                  },
                ),

                TextFormFieldWidget(
                  controller: districtController,
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                  onChange: (district) {
                    store.userStore.state.user!.neightbor = district;
                  },
                  label: 'BAIRRO',
                  labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                  borderColor: Theme.of(context).primaryColor,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                ),
                TextFormFieldWidget(
                  controller: streetNameController,
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                  onChange: (street) {
                    store.userStore.state.user!.street = street;
                  },
                  label: 'RUA',
                  labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                  borderColor: Theme.of(context).primaryColor,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                ),
                TextFormFieldWidget(
                  controller: complementController,
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                  onChange: (complement) {
                    store.userStore.state.user!.complement = complement;
                  },
                  label: 'COMPLEMENTO',
                  labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                  borderColor: Theme.of(context).primaryColor,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TripleBuilder(
                    store: store,
                    builder: (_, triple) {
                      return DefaultButtonWidget(
                        text: 'Salvar',
                        isDisabled: false,
                        onPressed: () async {
                          await store
                              .updateUserProfile(
                            store.userStore.state.user!.userId.toString(),
                            store.userStore.state.user!,
                          )
                              .catchError((onError) {
                            Helpers.showDefaultDialog(
                              context,
                              RequestErrorWidget(
                                buttonText: 'Fechar',
                                error: onError,
                                onPressed: () {
                                  Modular.to.pop();
                                },
                              ),
                            );
                          });
                        },
                        isLoading: triple.isLoading,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
