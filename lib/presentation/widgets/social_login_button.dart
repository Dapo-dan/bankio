import 'package:bankio/utils/const.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String label;
  final IconData icon;
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
        color: color ?? Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.white,
          ),
          horizontalSpaceSmall(),
          Text(
            label,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );

    // OutlinedButton.icon(
    //   onPressed: () {},
    //   icon: Icon(icon, color: color),
    //   label: Text(label),
    //   style: OutlinedButton.styleFrom(
    //     padding: const EdgeInsets.symmetric(vertical: 12),
    //     side: BorderSide(color: color ?? Theme.of(context).primaryColor),
    //     backgroundColor: Theme.of(context).cardColor,
    //   ),
    // );
  }
}
