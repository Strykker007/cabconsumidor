import 'package:cabproject/app/core/shared/widgets/app_bar_widget.dart';
import 'package:cabproject/app/core/shared/widgets/loading/loading_widget.dart';
import 'package:cabproject/app/core/stores/user_store.dart';
import 'package:cabproject/app/modules/transactions/widgets/transaction_tile_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabproject/app/modules/transactions/transactions_store.dart';
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
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      store.getTransactionsList(userStore.state.user!.userId!.toString());
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TripleBuilder(
          store: store,
          builder: (context, triple) {
            if (triple.isLoading) {
              return const LoadingWidget();
            }
            if (store.state.isEmpty) {
              return const Center(child: Text('Nenhuma transação encontrada!'));
            }
            return RefreshIndicator(
              onRefresh: () async {
                await store.getTransactionsList(
                    userStore.state.user!.userId!.toString());
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
                        return TransactionTileWidget(
                          transaction: store.state[index],
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
    );
  }
}
