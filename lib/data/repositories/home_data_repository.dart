import 'package:bankio/data/models/card_model.dart';
import 'package:bankio/data/models/exchange_rate_model.dart';
import 'package:bankio/data/models/transaction_model.dart';

class HomeDataRepository {
  List<CardModel> getPaymentCards() {
    return [
      CardModel(
        cardholderName: 'John Doe',
        cardNumber: '3141 5926 5358 9793',
        expiryDate: '06/22',
        cardType: 'MasterCard',
      ),
      CardModel(
        cardholderName: 'Jane Smith',
        cardNumber: '1234 5678 9012 3456',
        expiryDate: '10/24',
        cardType: 'Visa',
      ),
    ];
  }

  List<ExchangeRateModel> getExchangeRates() {
    return [
      ExchangeRateModel(currency: 'AUD', rate: 0.8, percentageChange: 4.5),
      ExchangeRateModel(currency: 'EUR', rate: 1.1, percentageChange: -1.3),
      ExchangeRateModel(currency: 'USD', rate: 1.5, percentageChange: -10.3),
    ];
  }

  List<TransactionModel> getTransactions() {
    return [
      TransactionModel(
        title: 'Car loans',
        time: '9:01am',
        amount: 13.10,
        percentageChange: -4.5,
        icon: 'car',
      ),
      TransactionModel(
        title: 'Mortgage real estate',
        time: '5:01am 2022-04-12',
        amount: 15.10,
        percentageChange: -1.5,
        icon: 'home',
      ),
      TransactionModel(
        title: 'Personal loans',
        time: '7:02pm 2022-03-13',
        amount: 41.10,
        percentageChange: -6.5,
        icon: 'person',
      ),
    ];
  }
}
