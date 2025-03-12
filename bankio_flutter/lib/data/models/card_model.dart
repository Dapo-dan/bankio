class CardModel {
  final String cardholderName;
  final String cardNumber;
  final String expiryDate;
  final String cardType; // e.g., "MasterCard", "Visa"

  CardModel({
    required this.cardholderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardType,
  });
}
