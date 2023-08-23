import 'package:cabconsumidor/app/core/enums/buttons_enum.dart';
import 'package:cabconsumidor/app/core/models/transaction_register_model.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/transactions/transactions_store.dart';
import 'package:cabconsumidor/app/modules/transactions/widgets/transaction_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TransactionListWidget extends StatelessWidget {
  final List<TransactionRegisterModel> transactions;
  final bool isLoading;
  const TransactionListWidget({
    super.key,
    required this.transactions,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final TransactionsStore store = Modular.get();
    final UserStore userStore = Modular.get();

    return Container(
      height: MediaQuery.of(context)
          .size
          .height, // Definir altura para ocupar a tela inteira
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          await store.getTransactionsList(
            userStore.state.user!.userId!.toString(),
          );
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
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
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              transactions.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Nenhuma transação encontrada!'),
                        const SizedBox(height: 10),
                        DefaultButtonWidget(
                          buttonType: DefaultButtonType.outline,
                          text: 'Atualizar',
                          onPressed: () async {
                            await store.getTransactionsList(
                                userStore.state.user!.userId!.toString());
                          },
                          isLoading: false,
                          isDisabled: false,
                        ),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        isLoading
                            ? Column(
                                children: [
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: 200,
                                    child: Text(
                                      'Carregando informações...',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.black45,
                                          ),
                                    ),
                                  ),
                                ],
                              )
                            : SingleChildScrollView(
                                child: ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemBuilder: (context, index) {
                                    return TransactionTileWidget(
                                      transaction: transactions[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      color: Colors.grey,
                                    );
                                  },
                                  itemCount: store.state.length,
                                ),
                              ),
                      ],
                    ),
            ],
          ),
        ),
      ),
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
