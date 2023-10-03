import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/loading/loading_widget.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/transactions/stores/transactions_date_filter_store.dart';
import 'package:cabconsumidor/app/modules/transactions/widgets/date_filter_widget.dart';
import 'package:cabconsumidor/app/modules/transactions/widgets/transaction_tile_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabconsumidor/app/modules/transactions/stores/transactions_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class TransactionsPage extends StatefulWidget {
  final String title;
  const TransactionsPage({Key? key, this.title = 'TransactionsPage'})
      : super(key: key);
  @override
  TransactionsPageState createState() => TransactionsPageState();
}

class TransactionsPageState extends State<TransactionsPage> {
  final TransactionsStore store = Modular.get();
  final UserStore userStore = Modular.get();
  final TransactionsDateFilterStore transactionsDateFilterStore = Modular.get();

  @override
  void initState() {
    store.initStore();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      store.getTransactionsList();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TripleBuilder(
              store: transactionsDateFilterStore,
              builder: (context, triple) {
                return DateFilterWidget(
                  filterValue: transactionsDateFilterStore.state,
                );
              },
            ),
            Expanded(
              child: TripleBuilder(
                store: store,
                builder: (context, triple) {
                  if (triple.isLoading) {
                    return const LoadingWidget();
                  }
                  if (store.state.isEmpty) {
                    return const Center(
                        child: Text('Nenhuma transação encontrada!'));
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      await store.getTransactionsList();
                    },
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      padding: const EdgeInsets.all(20),
                      itemCount: store.state.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.grey.shade600,
                        );
                      },
                      itemBuilder: (context, index) {
                        return TransactionTileWidget(
                          transaction: store.state[index],
                        );
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
}
