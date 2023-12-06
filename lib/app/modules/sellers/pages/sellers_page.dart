import 'dart:developer';

import 'package:cabconsumidor/app/core/services/helpers.dart';
import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/error/request_error_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/loading/loading_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabconsumidor/app/modules/sellers/widgets/seller_tile_widget.dart';
import 'package:cabconsumidor/app/modules/sellers/widgets/sellers_filters_list_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabconsumidor/app/modules/sellers/stores/sellers_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SellersPage extends StatefulWidget {
  final String title;
  const SellersPage({Key? key, required this.title}) : super(key: key);
  @override
  SellersPageState createState() => SellersPageState();
}

class SellersPageState extends State<SellersPage> {
  final SellersStore store = Modular.get();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    store.getSellersList().catchError((onError) {
      log(onError.toString());
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget.title,
        backgroundColor: Colors.transparent,
      ).build(context) as AppBar,
      body: Container(
        padding: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TripleBuilder(
              store: store.paramsStore,
              builder: (context, triple) {
                return TextFormFieldWidget(
                  controller: searchController,
                  hintText: 'Pesquisar',
                  suffixIcon: IconButton(
                    icon: searchController.text.isNotEmpty
                        ? const Icon(Icons.close)
                        : const Icon(Icons.search),
                    onPressed: searchSellerByName,
                    color: Colors.grey.shade600,
                  ),
                  onChange: (name) async {
                    if (name!.isEmpty) {
                      store.paramsStore.state.name = null;
                      store.paramsStore.updateState(store.paramsStore.state);

                      await store.getSellersList().catchError(
                        (onError) {
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
                        },
                      );
                    } else {
                      store.paramsStore.state.name = name;
                    }
                  },
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                );
              },
            ),
            const SizedBox(height: 5),
            const SellersFiltersListWidget(),
            const SizedBox(height: 5),
            Expanded(
              child: TripleBuilder(
                store: store,
                builder: (context, triple) {
                  if (triple.isLoading) {
                    return const Center(
                      child: LoadingWidget(),
                    );
                  }
                  if (store.state.isEmpty) {
                    return const Center(
                      child: Text('Nenhum vendedor encontrado!'),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      await store.getSellersList().catchError(
                        (onError) {
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
                        },
                      );
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: store.state.length,
                      itemBuilder: (context, index) {
                        return SellerTileWidget(seller: store.state[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void searchSellerByName() async {
    if (searchController.text.isNotEmpty &&
        store.paramsStore.showClearSearchButton == false) {
      store.paramsStore.state.name = searchController.text;
      if (store.paramsStore.state.name!.isNotEmpty) {
        store.paramsStore.showClearSearchButton = true;
      }
      store.paramsStore.updateState(store.paramsStore.state);
      await store.getSellersList().catchError(
        (onError) {
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
        },
      );
    } else {
      searchController.clear();
      store.paramsStore.state.name = '';
      store.paramsStore.showClearSearchButton = false;
      store.paramsStore.updateState(store.paramsStore.state);
      await store.getSellersList().catchError(
        (onError) {
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
        },
      );
    }
  }
}
