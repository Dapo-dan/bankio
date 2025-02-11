import 'package:bankio/data/models/exchange_rate_model.dart';
import 'package:flutter/material.dart';

class ExchangeRateWidget extends StatelessWidget {
  final List<ExchangeRateModel> rates;

  const ExchangeRateWidget({required this.rates, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Exchange Rates', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: rates.length,
            itemBuilder: (context, index) {
              final rate = rates[index];
              return Container(
                width: 140,
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(rate.currency, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('\$${rate.rate}', style: const TextStyle(fontSize: 16)),
                    Text('${rate.percentageChange}%',
                        style: TextStyle(
                            color: rate.percentageChange >= 0 ? Colors.green : Colors.red)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
