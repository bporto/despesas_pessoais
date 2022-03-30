import 'package:despesas_pessoais/components/transaction_item.dart';
import 'package:despesas_pessoais/models/transaction.dart';
import 'package:despesas_pessoais/resources/strings.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(
    Key? key,
    this.transactions,
    this.onRemove,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  Strings.noTransactionsRegistered,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final tr = transactions[index];
              return TransactionItem(
                transactionValue: 'R\$${tr.value.toStringAsFixed(2)}',
                transactionTitle: tr.title,
                transactionDate: tr.date,
                transactionId: tr.id,
                onRemove: onRemove,
              );
            },
          );
  }
}
