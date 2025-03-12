class ExchangeRateModel {
  final String currency;
  final double rate;
  final double percentageChange;

  ExchangeRateModel({
    required this.currency,
    required this.rate,
    required this.percentageChange,
  });
}
