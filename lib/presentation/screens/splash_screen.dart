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
                      verticalSpaceSmall(),
                      Text(
                        'Bankio',
                        style: theme.textTheme.headlineMedium,
                      ),
                      verticalSpaceSmall(),
                      Text(
                        'No 1 app for E-bank, e-wallet, personal financial mobile application.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: AppButton(
                  onTap: () {
                    // Navigate to the next screen
                  },
                  title: 'GET STARTED',
                  buttonColor: theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
