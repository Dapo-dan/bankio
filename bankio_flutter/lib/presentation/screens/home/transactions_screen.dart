import 'package:bankio_flutter/logic/transaction/transaction_bloc.dart';
import 'package:bankio_flutter/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (_) => TransactionsBloc()..add(LoadTransactionsEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          leading: IconButton(
              icon: Icon(
                Icons.history,
                color: theme.colorScheme.onSecondaryContainer,
              ),
              onPressed: () {}),
          title: Center(
            child: Text(
              'Transactions',
              style: theme.textTheme.titleMedium,
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.currency_exchange,
                  color: theme.colorScheme.onSecondaryContainer,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: theme.colorScheme.onSecondaryContainer,
                ),
                onPressed: () {}),
          ],
        ),
        body: BlocBuilder<TransactionsBloc, TransactionsState>(
          builder: (context, state) {
            if (state is TransactionsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TransactionsLoaded) {
              return _buildContent(state, theme);
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }

  Widget _buildContent(TransactionsLoaded state, ThemeData theme) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(state, theme),
            verticalSpaceSmall(),
            _buildBarChart(state, theme),
            verticalSpaceMedium(),
            _buildMonthlyBudget(theme),
            verticalSpaceMedium(),
            _buildCategorySummaries(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(TransactionsLoaded state, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Balance',
            style: theme.textTheme.bodySmall,
          ),
          Text(
            '\$${state.totalBalance.toStringAsFixed(1)}',
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart(TransactionsLoaded state, ThemeData theme) {
    return Container(
      height: 450,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              20,
            ),
            topRight: Radius.circular(
              20,
            ),
          )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transactions',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    '\$${state.transaction.toStringAsFixed(1)}',
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
              DropdownButton<String>(
                value: 'Week',
                style: theme.textTheme.bodySmall,
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
          ),
          SizedBox(
            height: 350,
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                alignment: BarChartAlignment.spaceAround,
                maxY: state.transactions
                        .map((t) => t.amount)
                        .reduce((a, b) => a > b ? a : b) +
                    50,
                barGroups: state.transactions
                    .asMap()
                    .entries
                    .map((entry) =>
                        _buildBarGroup(entry.key, entry.value.amount))
                    .toList(),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (index, _) =>
                          Text(state.transactions[index.toInt()].day),
                    ),
                  ),
                ),
                gridData: const FlGridData(show: false),
                groupsSpace: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.black,
          width: 30,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ],
    );
  }

  Widget _buildMonthlyBudget(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            child: SizedBox(
              width: 50,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 2500,
                      showTitle: false,
                      color: theme.colorScheme.onSecondaryContainer,
                      radius: 7,
                    ),
                    PieChartSectionData(
                      value: 890.1,
                      showTitle: false,
                      color: theme.colorScheme.onPrimaryContainer,
                      radius: 8,
                    ),
                  ],
                  sectionsSpace: 1,
                  centerSpaceRadius: 20,
                  centerSpaceColor: theme.colorScheme.surface,
                ),
              ),
            ),
          ),
          horizontalSpaceMedium(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Monthly Budget',
                style: theme.textTheme.titleMedium,
              ),
              const Text('\$890.1 from \$2,500',
                  style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySummaries(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategoryCard(
              'Food & Restaurants', '\$890.12', Icons.shopping_cart, theme),
          _buildCategoryCard(
              'Tickets & Journey', '\$190.12', Icons.train, theme),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
      String title, String amount, IconData icon, ThemeData theme) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(amount, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
