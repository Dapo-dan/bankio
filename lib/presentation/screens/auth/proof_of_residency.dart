import 'package:bankio/presentation/widgets/button.dart';
import 'package:bankio/utils/const.dart';
import 'package:flutter/material.dart';

class ProofOfResidencyPage extends StatefulWidget {
  const ProofOfResidencyPage({super.key});

  @override
  State<ProofOfResidencyPage> createState() => _ProofOfResidencyPageState();
}

class _ProofOfResidencyPageState extends State<ProofOfResidencyPage> {
  String selectedVerificationMethod = "National Identity Card";

  final List<String> verificationMethods = [
    "National Identity Card",
    "Passport",
    "Driver License",
  ];

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
              "Proof of Residency",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            verticalSpaceMedium(),
            Text(
              "Nationality",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            verticalSpaceSmall(),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.flag, size: 24),
                  horizontalSpaceSmall(),
                  Text(
                    "United States",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      // Handle change nationality
                    },
                    child: const Text("Change"),
                  ),
                ],
              ),
            ),
            verticalSpaceMedium(),
            Text(
              "Verification method",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            verticalSpaceSmall(),
            Column(
              children: verificationMethods.map((method) {
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedVerificationMethod = method);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          selectedVerificationMethod == method
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          color: selectedVerificationMethod == method
                              ? Theme.of(context).primaryColor
                              : Theme.of(context)
                                  .primaryColor
                                  .withValues(alpha: 0.2),
                        ),
                        horizontalSpaceMedium(),
                        Text(
                          method,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    title: "SKIP",
                    onTap: () {
                      // Handle skip action
                    },
                    textColor: theme.colorScheme.onSecondaryContainer,
                    buttonColor: theme.colorScheme.primaryContainer,
                    borderColor: theme.colorScheme.secondaryContainer,
                  ),
                ),
                horizontalSpaceSmall(),
                Expanded(
                  child: AppButton(
                    title: "CONTINUE",
                    onTap: () {
                      // Handle continue action
                    },
                  ),
                ),
              ],
            ),
            verticalSpaceLarge(),
          ],
        ),
      ),
    );
  }
}
