import 'package:bankio/data/models/exchange_rate_model.dart';
import 'package:flutter/material.dart';

class ExchangeRateWidget extends StatelessWidget {
  final List<ExchangeRateModel> rates;

  const ExchangeRateWidget({required this.rates, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Exchange Rates',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
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
        const SizedBox(height: 10),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: rates.length,
            itemBuilder: (context, index) {
              final rate = rates[index];
              return Container(
                width: 180,
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onError,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 15),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        rate.currency,
                        style: theme.textTheme.bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${rate.rate}',
                          style: theme.textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              '${rate.percentageChange}%',
                              style: theme.textTheme.bodySmall!.copyWith(
                                  color: rate.percentageChange >= 0
                                      ? theme.colorScheme.onSecondary
                                      : theme.colorScheme.error),
                            ),
                            Icon(
                              rate.percentageChange >= 0
                                  ? Icons.keyboard_double_arrow_up_rounded
                                  : Icons.keyboard_double_arrow_down_rounded,
                            )
                          ],
                        ),
                      ],
                    ),
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
