import 'package:bankio/data/models/card_model.dart';
import 'package:flutter/material.dart';

class PaymentCardSlider extends StatelessWidget {
  final List<CardModel> cards;

  const PaymentCardSlider({required this.cards, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return Container(
            width: 300,
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: index.isEven ? Colors.red : Colors.orange,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(card.cardType, style: const TextStyle(color: Colors.white, fontSize: 18)),
                const Spacer(),
                Text(card.cardNumber, style: const TextStyle(color: Colors.white, fontSize: 18)),
                const SizedBox(height: 10),
                Text(card.cardholderName, style: const TextStyle(color: Colors.white, fontSize: 14)),
                Text(card.expiryDate, style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          );
        },
      ),
    );
  }
}
