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
  final double transaction;
  final List<TransactionModel2> transactions;

  TransactionsLoaded(this.totalBalance, this.transaction, this.transactions);
}

// BLoC
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsLoading()) {
    on<LoadTransactionsEvent>((event, emit) {
      // Dummy Data
      const double totalBalance = 41900.1;
      const double transaction = 104190.0;
      final List<TransactionModel2> transactions = [
        TransactionModel2(day: 'Mon', date: '01', amount: 134.90),
        TransactionModel2(day: 'Tue', date: '02', amount: 890.12),
        TransactionModel2(day: 'Wed', date: '03', amount: 250.00),
        TransactionModel2(day: 'Thu', date: '04', amount: 190.12),
        TransactionModel2(day: 'Fri', date: '05', amount: 150.50),
        TransactionModel2(day: 'Sat', date: '06', amount: 320.00),
      ];

      emit(TransactionsLoaded(totalBalance, transaction, transactions));
    });
  }
}
