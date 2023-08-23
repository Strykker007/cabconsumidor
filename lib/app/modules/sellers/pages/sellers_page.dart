import 'package:cabconsumidor/app/core/services/helpers.dart';
import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/error/request_error_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/loading/loading_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabconsumidor/app/modules/sellers/widgets/seller_tile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabconsumidor/app/modules/sellers/sellers_store.dart';
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
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    store.getSellersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget.title,
        backgroundColor: Colors.transparent,
      ).build(context) as AppBar,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormFieldWidget(
                controller: searchController,
                hintText: 'Pesquisar',
                suffix: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    if (searchController.text.isEmpty) {
                      await store.getSellersList();
                    } else {
                      store.params.name = searchController.text;
                      await store.getSellersList().catchError((onError) {
                        Helpers.showDefaultDialog(
                            context,
                            RequestErrorWidget(
                              error: onError,
                              buttonText: 'Fechar',
                              onPressed: () {
                                Modular.to.pop();
                              },
                            ));
                      });
                    }
                  },
                  color: Colors.grey.shade600,
                ),
                onChange: (name) async {
                  if (name!.isEmpty) {
                    await store.getSellersList();
                  }
                },
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
                        await store.getSellersList();
                      },
                      child: ListView.builder(
                        itemCount: store.state.length,
                        itemBuilder: (context, index) {
                          return SellerTileWidget(seller: store.state[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
