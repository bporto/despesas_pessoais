import 'package:despesas_pessoais/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final String transactionValue;
  final String transactionTitle;
  final String transactionId;
  final DateTime transactionDate;
  final Function onRemove;

  const TransactionItem({
    Key? key,
    required this.transactionValue,
    required this.transactionTitle,
    required this.transactionId,
    required this.transactionDate,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purple[400],
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                transactionValue,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          transactionTitle,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(transactionDate),
        ),
        trailing: mediaQuery.size.width > 400
            ? TextButton.icon(
                onPressed: () {
                  onRemove(transactionId);
                },
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                ),
                label: Text(
                  Strings.delete,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            : IconButton(
                onPressed: () {
                  onRemove(transactionId);
                },
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                ),
              ),
      ),
    );
  }
}
