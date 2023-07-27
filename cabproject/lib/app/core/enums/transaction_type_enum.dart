import 'package:flutter/material.dart';

enum TransactionType { deposit, withdraw, debit, cashback, payment }

extension TransactionTypeEnum on TransactionType {
  String get label {
    switch (this) {
      case TransactionType.cashback:
        return 'Cashback';
      case TransactionType.deposit:
        return 'Depósito';
      case TransactionType.withdraw:
        return 'Saque';
      case TransactionType.debit:
        return 'Débito';
      case TransactionType.payment:
        return 'Pagamento';
      default:
        return toString();
    }
  }

  String? get toJson {
    switch (this) {
      case TransactionType.cashback:
        return 'Cashback';
      case TransactionType.deposit:
        return 'Depósito';
      case TransactionType.withdraw:
        return 'Saque';
      case TransactionType.debit:
        return 'Débito';
      case TransactionType.payment:
        return 'Pagamento';
      default:
        return null;
    }
  }
}

Widget? icon(TransactionType type) {
  switch (type) {
    case TransactionType.cashback:
      return const Icon(
        Icons.add_card_rounded,
        color: Colors.blue,
      );
    case TransactionType.deposit:
      return const Icon(
        Icons.add_card_rounded,
        color: Colors.green,
      );
    case TransactionType.withdraw:
      return const Icon(
        Icons.trending_up_rounded,
        color: Colors.orange,
      );
    case TransactionType.debit:
      return const Icon(
        Icons.add_card_rounded,
        color: Colors.red,
      );
    case TransactionType.payment:
      return const Icon(
        Icons.add_card_rounded,
        color: Colors.red,
      );
    default:
      return null;
  }
}

TransactionType? transactionTypeFromJson(String? transactionType) {
  switch (transactionType) {
    case 'Cashback':
      return TransactionType.cashback;
    case 'Depósito':
      return TransactionType.deposit;
    case 'Saque':
      return TransactionType.withdraw;
    case 'Débito':
      return TransactionType.debit;
    case 'Pagamento':
      return TransactionType.payment;
    default:
      return null;
  }
}
