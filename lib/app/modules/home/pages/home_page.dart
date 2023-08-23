import 'dart:developer';

import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/home/stores/balance_store.dart';
import 'package:cabconsumidor/app/modules/home/widgets/balance_widget.dart';
import 'package:cabconsumidor/app/modules/home/widgets/custom_app_bar.dart';
import 'package:cabconsumidor/app/modules/home/widgets/menu_list_widgets.dart';
import 'package:cabconsumidor/app/modules/home/widgets/transactions_list_widget.dart';
import 'package:cabconsumidor/app/modules/transactions/transactions_store.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final UserStore userStore;
  final BalanceStore balanceStore = Modular.get<BalanceStore>();
  final TransactionsStore transactionsStore = Modular.get<TransactionsStore>();

  @override
  void initState() {
    super.initState();
    userStore = Modular.get<UserStore>();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      log(userStore.state.user!.userId!.toString());
      transactionsStore
          .getTransactionsList(userStore.state.user!.userId!.toString());
      balanceStore.getBalanceValue(userStore.state.user!.userId!.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar().build(context) as AppBar,
      body: Center(
        child: Column(
          children: [
            TripleBuilder(
              store: balanceStore,
              builder: (context, triple) {
                return BalanceWidget(balanceStore: balanceStore);
              },
            ),
            const SizedBox(height: 15),
            const MenuListWidgets(),
            const SizedBox(height: 15),
            TripleBuilder(
              store: transactionsStore,
              builder: (context, triple) {
                return TransactionListWidget(
                  transactions: transactionsStore.state,
                  isLoading: triple.isLoading,
                );
              },
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: CustomNavigationBar(
          currentIndex: 0,
          isFloating: true,
          iconSize: 30,
          selectedColor: Theme.of(context).primaryColor,
          unSelectedColor: Colors.black45,
          backgroundColor: Colors.white,
          strokeColor: Theme.of(context).primaryColor,
          borderRadius: const Radius.circular(10),
          onTap: (itemSelected) {
            if (itemSelected == 1) {
              Modular.to
                  .pushNamed('/home/transactions/', arguments: 'Transações');
            }
            if (itemSelected == 2) {
              Modular.to.pushNamed('/home/deposit/', arguments: 'Depositar');
            }
            if (itemSelected == 3) {
              Modular.to
                  .pushNamed('/home/notifications/', arguments: 'Notificações');
            }
            if (itemSelected == 4) {
              Modular.to.pushNamed('/home/config/', arguments: 'Configurações');
            }
          },
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.house_outlined),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.wallet_outlined),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.add),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.notifications_outlined),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
