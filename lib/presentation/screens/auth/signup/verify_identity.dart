import 'package:bankio/presentation/screens/auth/signup/proof_of_residency.dart';
import 'package:bankio/presentation/widgets/button.dart';
import 'package:bankio/utils/const.dart';
import 'package:flutter/material.dart';

class VerifyIdentityPage extends StatelessWidget {
  const VerifyIdentityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).iconTheme.color),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceLarge(),
            Text(
              "Let's verify your identity",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            verticalSpaceSmall(),
            Text(
              "We are required to verify your identity before you can use the application. Your information will be encrypted and stored securely.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            verticalSpaceMedium(),
            Center(
              child: Icon(
                Icons.calendar_view_day_rounded,
                size: 300,
                color: theme.colorScheme.primaryContainer,
              ),
            ),
            const Spacer(),
            AppButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProofOfResidencyPage(),
                  ),
                );
              },
              title: "VERIFY IDENTITY",
            ),
            verticalSpaceLarge(),
          ],
        ),
      ),
    );
  }
}
