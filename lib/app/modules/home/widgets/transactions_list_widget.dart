import 'package:cabconsumidor/app/core/enums/buttons_enum.dart';
import 'package:cabconsumidor/app/core/models/transaction_register_model.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/transactions/stores/transactions_store.dart';
import 'package:cabconsumidor/app/modules/transactions/widgets/transaction_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TransactionsStore store = Modular.get();
    final UserStore userStore = Modular.get();
    store.params.userId = userStore.state.user!.userId!.toString();

    return Column(
      children: [
        TripleBuilder(
          store: store,
          builder: (context, triple) {
            if (store.state.isEmpty && !triple.isLoading) {
              return Column(
                children: [
                  const Text(
                      'Nenhuma transação encontrada durante este período!'),
                  const SizedBox(height: 10),
                  DefaultButtonWidget(
                    buttonType: DefaultButtonType.outline,
                    text: 'Atualizar',
                    onPressed: () async {
                      await store.getTransactionsList();
                    },
                    isLoading: false,
                    isDisabled: false,
                  ),
                ],
              );
            }
            if (triple.isLoading) {
              return Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: Text(
                      'Carregando informações...',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const CircularProgressIndicator.adaptive()
                ],
              );
            }
            return ListView.separated(
              shrinkWrap: true,
              reverse: true,
              itemBuilder: (context, index) {
                return TransactionTileWidget(
                  transaction: store.state[index],
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                );
              },
              itemCount: store.state.length,
            );
          },
        ),
      ],
    );
  }
}

// class TransactionListWidget extends StatelessWidget {
//   final List<TransactionRegisterModel> transactions;
//   final bool isLoading;
//   const TransactionListWidget({
//     super.key,
//     required this.transactions,
//     required this.isLoading,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final TransactionsStore store = Modular.get();
//     final UserStore userStore = Modular.get();

//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: Container(
//         // height: MediaQuery.of(context).size.height * 0.5,
//         width: MediaQuery.of(context).size.width * 0.9,
//         padding: const EdgeInsets.all(10),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(15),
//             topRight: Radius.circular(15),
//           ),
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: transactions.isNotEmpty
//                   ? Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         const Text('Nenhuma transação encontrada!'),
//                         const SizedBox(height: 10),
//                         DefaultButtonWidget(
//                           buttonType: DefaultButtonType.outline,
//                           text: 'Atualizar',
//                           onPressed: () async {
//                             await store.getTransactionsList(
//                                 userStore.state.user!.userId!.toString());
//                           },
//                           isLoading: false,
//                           isDisabled: false,
//                         ),
//                       ],
//                     )
//                   : Column(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Row(
//                           children: [
//                             const Icon(Icons.wallet),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               'Transações',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyMedium!
//                                   .copyWith(
//                                     color: Colors.black45,
//                                   ),
//                             ),
//                             const Spacer(),
//                           ],
//                         ),
//                         const Divider(
//                           color: Colors.grey,
//                         ),
//                         isLoading
//                             ? const LoadingWidget()
//                             : RefreshIndicator(
//                                 displacement: 50,
//                                 triggerMode:
//                                     RefreshIndicatorTriggerMode.anywhere,
//                                 onRefresh: () async {
//                                   await store.getTransactionsList(
//                                     userStore.state.user!.userId!.toString(),
//                                   );
//                                 },
//                                 child: Column(
//                                   children: [
//                                     ListView.separated(
//                                       physics:
//                                           const AlwaysScrollableScrollPhysics(),
//                                       shrinkWrap: true,
//                                       reverse: true,
//                                       itemBuilder: (context, index) {
//                                         return TransactionTileWidget(
//                                           transaction: transactions[0],
//                                         );
//                                       },
//                                       separatorBuilder: (context, index) {
//                                         return const Divider(
//                                           color: Colors.grey,
//                                         );
//                                       },
//                                       itemCount: 2,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                       ],
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
