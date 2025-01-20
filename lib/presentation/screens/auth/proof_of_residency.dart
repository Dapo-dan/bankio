import 'package:bankio/presentation/widgets/button.dart';
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
            Text(
              "Proof of Residency",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Nationality",
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
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.flag, size: 24),
                  SizedBox(width: 12),
                  Text("United States"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Verification method",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Column(
              children: verificationMethods.map((method) {
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedVerificationMethod = method);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: selectedVerificationMethod == method
                          ? Theme.of(context)
                              .primaryColor
                              .withValues(alpha: 0.2)
                          : Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectedVerificationMethod == method
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).dividerColor,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          selectedVerificationMethod == method
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          color: selectedVerificationMethod == method
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).dividerColor,
                        ),
                        const SizedBox(width: 12),
                        Text(method),
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
                  ),
                ),
                const SizedBox(width: 12),
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
          ],
        ),
      ),
    );
  }
}
