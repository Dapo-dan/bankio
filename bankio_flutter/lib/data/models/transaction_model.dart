class TransactionModel {
  final String title;
  final String time;
  final double amount;
  final double percentageChange;
  final String icon;

  TransactionModel({
    required this.title,
    required this.time,
    required this.amount,
    required this.percentageChange,
    required this.icon,
  });
}

class TransactionModel2 {
  final String day;
  final String date;
  final double amount;

  TransactionModel2({required this.day,required this.date, required this.amount});
}
