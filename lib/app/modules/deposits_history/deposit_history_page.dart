import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/loading/loading_widget.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/deposits_history/deposit_history_list_store.dart';
import 'package:cabconsumidor/app/modules/deposits_history/widgets/deposit_history_tile_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class DepositHistoryPage extends StatefulWidget {
  final String? title;
  const DepositHistoryPage({Key? key, this.title = 'Meus Depósitos'})
      : super(key: key);
  @override
  DepositHistoryPageState createState() => DepositHistoryPageState();
}

class DepositHistoryPageState extends State<DepositHistoryPage> {
  final DepositHistoryStore store = Modular.get();
  final UserStore userStore = Modular.get();
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      store.getDepositHistoryList();
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
              return const Center(child: Text('Nenhuma compra encontrada!'));
            }
            return RefreshIndicator(
              onRefresh: () async {
                await store.getDepositHistoryList();
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
                        return DepositHistoryTileWidget(
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
    );
  }
}
