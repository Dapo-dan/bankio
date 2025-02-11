import 'package:bankio/data/models/transaction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class TransactionsEvent {}

class LoadTransactionsEvent extends TransactionsEvent {}

// States
abstract class TransactionsState {}

class TransactionsLoading extends TransactionsState {}

class TransactionsLoaded extends TransactionsState {
  final double totalBalance;
  final List<TransactionModel2> transactions;

  TransactionsLoaded(this.totalBalance, this.transactions);
}

// BLoC
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsLoading()) {
    on<LoadTransactionsEvent>((event, emit) {
      // Dummy Data
      const double totalBalance = 41900.1;
      final List<TransactionModel2> transactions = [
        TransactionModel2(day: 'Mon', amount: 134.90),
        TransactionModel2(day: 'Tue', amount: 890.12),
        TransactionModel2(day: 'Wed', amount: 250.00),
        TransactionModel2(day: 'Thu', amount: 190.12),
        TransactionModel2(day: 'Fri', amount: 150.50),
        TransactionModel2(day: 'Sat', amount: 320.00),
      ];

      emit(TransactionsLoaded(totalBalance, transactions));
    });
  }
}
