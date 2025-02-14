import 'package:bankio/data/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionListWidget extends StatelessWidget {
  final List<TransactionModel> transactions;

  const TransactionListWidget({required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Transactions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return ListTile(
              minVerticalPadding: 15,
              leading: CircleAvatar(
                backgroundColor: theme.colorScheme.onError,
                child: Icon(
                  transaction.icon == 'car'
                      ? Icons.directions_car
                      : transaction.icon == 'home'
                          ? Icons.home
                          : Icons.person,
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ),
              title: Text(
                transaction.title,
                style: theme.textTheme.titleSmall,
              ),
              subtitle: Text(
                transaction.time,
                style: theme.textTheme.bodySmall,
              ),
              trailing: Column(
                children: [
                  Text(
                    '\$${transaction.amount}',
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(
                    '${transaction.percentageChange} %',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
