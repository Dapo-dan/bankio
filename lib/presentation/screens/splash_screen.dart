import 'package:bankio/presentation/widgets/button.dart';
import 'package:bankio/utils/const.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(BODY_PADDING),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon or logo
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: theme.primaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.savings_rounded,
                          size: 60,
                          color: theme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Bankio',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'No 1 for E-bank, e-wallet, personal financial mobile application.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),

              // Get Started Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: AppButton(
                  onTap: () {
                    // Navigate to the next screen
                  },
                  title: 'GET STARTED',
                  buttonColor: theme.primaryColor,
                ),
              ),

              // Payment provider logos
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 16.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Image.asset('assets/icons/visa.png', height: 30),
              //       SizedBox(width: 12),
              //       Image.asset('assets/icons/mastercard.png', height: 30),
              //       SizedBox(width: 12),
              //       Image.asset('assets/icons/amex.png', height: 30),
              //       SizedBox(width: 12),
              //       Image.asset('assets/icons/paypal.png', height: 30),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
