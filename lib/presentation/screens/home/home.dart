import 'package:bankio/data/repositories/home_data_repository.dart';
import 'package:bankio/logic/home/home_bloc.dart';
import 'package:bankio/presentation/screens/home/widgets/exchange_rate_widget.dart';
import 'package:bankio/presentation/screens/home/widgets/payment_card_slider.dart';
import 'package:bankio/presentation/screens/home/widgets/transaction_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(HomeDataRepository())..add(LoadHomeData()),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PaymentCardSlider(cards: state.cards),
                      const SizedBox(height: 20),
                      ExchangeRateWidget(rates: state.exchangeRates),
                      const SizedBox(height: 20),
                      TransactionListWidget(transactions: state.transactions),
                    ],
                  ),
                ),
              );
            } else if (state is HomeError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
