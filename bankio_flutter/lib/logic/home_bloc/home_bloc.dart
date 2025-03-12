import 'package:bankio_flutter/data/models/card_model.dart';
import 'package:bankio_flutter/data/models/exchange_rate_model.dart';
import 'package:bankio_flutter/data/models/transaction_model.dart';
import 'package:bankio_flutter/data/repositories/home_data_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeDataRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadHomeData>((event, emit) async {
      emit(HomeLoading());
      try {
        // Fetch all data from repository
        final cards = repository.getPaymentCards();
        final exchangeRates = repository.getExchangeRates();
        final transactions = repository.getTransactions();

        emit(HomeLoaded(
          cards: cards,
          exchangeRates: exchangeRates,
          transactions: transactions,
        ));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
