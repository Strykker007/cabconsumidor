import 'package:brasil_fields/brasil_fields.dart';
import 'package:cabproject/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabproject/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabproject/app/modules/address/address_store.dart';
import 'package:flutter/services.dart';
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

  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetNameController = TextEditingController();
  final TextEditingController complementController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  @override
  void initState() {
    zipCodeController.text = store.userStore.state.user!.postalCode ?? '';
    districtController.text = store.userStore.state.user!.neightbor ?? '';
    cityController.text = store.userStore.state.user!.city.toString();
    streetNameController.text = store.userStore.state.user!.street ?? '';
    complementController.text = store.userStore.state.user!.complement ?? '';
    stateController.text = store.userStore.state.user!.country.toString();
    super.initState();
  }

  @override
  void dispose() {
    zipCodeController.clear();
    districtController.clear();
    cityController.clear();
    streetNameController.clear();
    complementController.clear();
    stateController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Modular.to.pushNamed('/home/config');
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                ),
              ),
            ),
            TextFormFieldWidget(
              controller: zipCodeController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Theme.of(context).primaryColor,
              ),
              onChange: (cep) {
                store.userStore.state.user!.postalCode = cep!;
              },
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
            TextFormFieldWidget(
              controller: stateController,
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Theme.of(context).primaryColor,
              ),
              onChange: (uf) {
                // store.userStore.state.country = uf;
              },
              label: 'UF',
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
            //TODO refazer o widget para atualizar a cidade de acordo com o id

            TextFormFieldWidget(
              controller: cityController,
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Theme.of(context).primaryColor,
              ),
              onChange: (city) {
                // store.userStore.state.city = city;
              },
              label: 'CIDADE',
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
                      await store.updateUserProfile(
                        store.userStore.state.user!.userId.toString(),
                        store.userStore.state.user!,
                      );
                    },
                    isLoading: triple.isLoading,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
