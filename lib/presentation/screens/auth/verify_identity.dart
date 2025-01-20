import 'package:bankio/presentation/screens/auth/proof_of_residency.dart';
import 'package:bankio/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class VerifyIdentityPage extends StatelessWidget {
  const VerifyIdentityPage({super.key});

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
              "Let’s verify your identity",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "We are required to verify your identity before you can use the application. Your information will be encrypted and stored securely.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/identity_verification.png',
                height: 200,
              ),
            ),
            const SizedBox(height: 40),
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
          ],
        ),
      ),
    );
  }
}
