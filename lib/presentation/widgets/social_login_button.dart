import 'package:bankio/utils/const.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String label;
  final String icon;
  final Color? color;

  const SocialLoginButton({
    super.key,
    required this.label,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color ?? theme.colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 50,
          ),
          horizontalSpaceMedium(),
          Text(
            label,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class SocialLoginButton2 extends StatelessWidget {
  final String icon;

  const SocialLoginButton2({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 40,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.colorScheme.onPrimaryContainer,
        border: Border.all(
          color: theme.colorScheme.primaryContainer,
        ),
      ),
      child: Image.asset(
        icon,
        width: 30,
      ),
    );
  }
}
