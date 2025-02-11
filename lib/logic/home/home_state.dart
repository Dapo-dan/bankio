part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CardModel> cards;
  final List<ExchangeRateModel> exchangeRates;
  final List<TransactionModel> transactions;

  const HomeLoaded({
    required this.cards,
    required this.exchangeRates,
    required this.transactions,
  });
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);
}