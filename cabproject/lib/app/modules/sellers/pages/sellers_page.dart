import 'package:cabproject/app/core/shared/widgets/loading/loading_widget.dart';
import 'package:cabproject/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabproject/app/modules/sellers/widgets/seller_tile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabproject/app/modules/sellers/sellers_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SellersPage extends StatefulWidget {
  const SellersPage({Key? key}) : super(key: key);
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
                      await store.getSellersListByName(searchController.text);
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
