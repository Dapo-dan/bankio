import 'package:bankio/presentation/screens/home/home.dart';
import 'package:bankio/presentation/screens/home/transactions_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2; // Default selected index is 'Home'

  final List<Widget> _screens = [
    const TransactionPage(),
    const Center(child: Text('Feeds Screen')),
    const HomePage(),
    const Center(child: Text('Wallet Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline,
                color: colorScheme.onSecondaryContainer),
            activeIcon: Icon(Icons.pie_chart, color: colorScheme.primary),
            label: 'Trans.',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined,
                color: colorScheme.onSecondaryContainer),
            activeIcon: Icon(Icons.feed, color: colorScheme.primary),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,
                color: colorScheme.onSecondaryContainer),
            activeIcon: Icon(Icons.home, color: colorScheme.primary),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined,
                color: colorScheme.onSecondaryContainer),
            activeIcon:
                Icon(Icons.account_balance_wallet, color: colorScheme.primary),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,
                color: colorScheme.onSecondaryContainer),
            activeIcon: Icon(Icons.person, color: colorScheme.primary),
            label: 'Profile',
          ),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSecondaryContainer,
        showUnselectedLabels: true,
      ),
    );
  }
}
