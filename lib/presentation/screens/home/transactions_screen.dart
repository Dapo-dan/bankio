import 'package:bankio/logic/transaction/transaction_bloc.dart';
import 'package:bankio/presentation/screens/home/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionsBloc()..add(LoadTransactionsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transactions'),
          actions: [
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.currency_exchange), onPressed: () {}),
          ],
        ),
        body: BlocBuilder<TransactionsBloc, TransactionsState>(
          builder: (context, state) {
            if (state is TransactionsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TransactionsLoaded) {
              return _buildContent(state);
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
        bottomNavigationBar: BottomNavigation(
          currentIndex: 0, // Transactions tab
          onTap: (index) {
            // Handle navigation
          },
        ),
      ),
    );
  }

  Widget _buildContent(TransactionsLoaded state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(state),
            const SizedBox(height: 20),
            _buildBarChart(state),
            const SizedBox(height: 20),
            _buildMonthlyBudget(),
            const SizedBox(height: 20),
            _buildCategorySummaries(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(TransactionsLoaded state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Balance',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            Text(
              '\$${state.totalBalance.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        DropdownButton<String>(
          value: 'Week',
          items: const [
            DropdownMenuItem(value: 'Week', child: Text('Week')),
            DropdownMenuItem(value: 'Month', child: Text('Month')),
            DropdownMenuItem(value: 'Year', child: Text('Year')),
          ],
          onChanged: (value) {
            // Handle time period change
          },
        ),
      ],
    );
  }

  Widget _buildBarChart(TransactionsLoaded state) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: state.transactions
                  .map((t) => t.amount)
                  .reduce((a, b) => a > b ? a : b) +
              50,
          barGroups: state.transactions
              .asMap()
              .entries
              .map((entry) => _buildBarGroup(entry.key, entry.value.amount))
              .toList(),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (index, _) =>
                    Text(state.transactions[index.toInt()].day),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y, color: Colors.black, width: 16),
      ],
    );
  }

  Widget _buildMonthlyBudget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.pie_chart, color: Colors.black),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Monthly Budget',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('\$890.1 from \$2,500', style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySummaries() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCategoryCard(
            'Food & Restaurants', '\$890.12', Icons.shopping_cart),
        _buildCategoryCard('Tickets & Journey', '\$190.12', Icons.train),
      ],
    );
  }

  Widget _buildCategoryCard(String title, String amount, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 28, color: Colors.black),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 8),
            Text(amount,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
