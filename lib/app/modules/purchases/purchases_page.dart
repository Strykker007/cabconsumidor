import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/loading/loading_widget.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/purchases/purchases_list_store.dart';
import 'package:cabconsumidor/app/modules/purchases/widgets/purchases_tile_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../core/shared/widgets/date_filter/date_filter_widget.dart';
import '../../core/stores/transactions_date_filter_store.dart';

class PurchasesPage extends StatefulWidget {
  final String? title;
  const PurchasesPage({Key? key, this.title = 'Minhas Compras'})
      : super(key: key);
  @override
  PurchasesPageState createState() => PurchasesPageState();
}

class PurchasesPageState extends State<PurchasesPage> {
  final PurchasesStore store = Modular.get();
  final UserStore userStore = Modular.get();

  final DateFilterStore transactionsDateFilterStore = DateFilterStore();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      store.getPurchasesList();
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
      body: ColoredBox(
        color: Colors.transparent,
        child: Column(
          children: [
            TripleBuilder(
              store: transactionsDateFilterStore,
              builder: (context, triple) {
                return DateFilterWidget(
                  store: transactionsDateFilterStore,
                  controllerStore: store,
                  onUpdateFunction: store.getPurchasesList,
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TripleBuilder(
                  store: store,
                  builder: (context, triple) {
                    if (triple.isLoading) {
                      return const LoadingWidget();
                    }
                    if (store.state.isEmpty) {
                      return const Center(
                          child: Text('Nenhuma compra encontrada!'));
                    }
                    return RefreshIndicator(
                      onRefresh: () async {
                        await store.getPurchasesList();
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              reverse: true,
                              padding: EdgeInsets.zero,
                              itemCount: store.state.length,
                              separatorBuilder: (context, index) {
                                return Divider(
                                  color: Colors.grey.shade600,
                                );
                              },
                              itemBuilder: (context, index) {
                                return PurchasesTileWidget(
                                  purchase: store.state[index],
                                );
                              },
                            )
                          ],
                        ),
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
