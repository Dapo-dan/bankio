import 'package:bankio/data/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionListWidget extends StatelessWidget {
  final List<TransactionModel> transactions;

  const TransactionListWidget({required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('See all', style: TextStyle(fontSize: 14, color: Colors.blue)),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green[50],
                child: Icon(transaction.icon == 'car'
                    ? Icons.directions_car
                    : transaction.icon == 'home'
                        ? Icons.home
                        : Icons.person),
              ),
              title: Text(transaction.title),
              subtitle: Text(transaction.time),
              trailing: Text(
                '\$${transaction.amount}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ],
    );
  }
}
