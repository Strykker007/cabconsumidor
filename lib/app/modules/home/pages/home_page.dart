import 'dart:developer';

import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/home/stores/balance_store.dart';
import 'package:cabconsumidor/app/modules/home/stores/home_transaction_list_filter_store.dart';
import 'package:cabconsumidor/app/modules/home/widgets/balance_widget.dart';
import 'package:cabconsumidor/app/modules/home/widgets/custom_app_bar.dart';
import 'package:cabconsumidor/app/modules/home/widgets/home_transactions_filter_widget.dart';
import 'package:cabconsumidor/app/modules/home/widgets/menu_list_widgets.dart';
import 'package:cabconsumidor/app/modules/home/widgets/transactions_list_widget.dart';
import 'package:cabconsumidor/app/modules/transactions/stores/transactions_store.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../core/utils/formaters.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final UserStore userStore;
  final BalanceStore balanceStore = Modular.get<BalanceStore>();
  final HomeTransactionListFilterStore transactionFilterStore = Modular.get();
  final TransactionsStore transactionsStore = Modular.get<TransactionsStore>();

  @override
  void initState() {
    super.initState();
    userStore = Modular.get<UserStore>();
    transactionsStore.params.initialDate = Formaters.dateToStringDateWithHifen(
      DateTime.now().subtract(
        const Duration(
          days: 7,
        ),
      ),
    );

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (timeStamp) {
        transactionsStore.getTransactionsList();
        balanceStore.getBalanceValue(userStore.state.user!.userId!.toString());
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const CustomAppBar().build(context) as AppBar,
      body: Column(
        mainAxisSize: MainAxisSize.max,
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
          Container(
            padding: EdgeInsets.zero,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                const Icon(Icons.wallet),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Transações',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black45,
                      ),
                ),
                const Spacer(),
                const HomeTransactionsFilterWidget()
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TransactionListWidget(),
              ),
            ),
          ),
        ],
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
